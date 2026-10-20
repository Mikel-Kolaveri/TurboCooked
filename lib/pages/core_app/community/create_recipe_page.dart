import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/auth/user_notifier.dart';
import 'package:recipe_app/constants/test_network_images.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/extensions/color_extension.dart';
import 'package:recipe_app/providers/community_recipes_provider.dart';
import 'package:recipe_app/theme/my_colors.dart';
import 'package:recipe_app/theme/my_styles.dart';
import 'package:recipe_app/widgets/back_button.dart';
import 'package:recipe_app/widgets/button.dart';
import 'package:recipe_app/widgets/gap.dart';
import 'package:recipe_app/widgets/my_box.dart';
import 'package:recipe_app/widgets/my_padding.dart';
import 'package:recipe_app/widgets/my_text.dart';
import 'package:recipe_app/widgets/my_text_field.dart';

class CreateRecipePage extends ConsumerStatefulWidget {
  const CreateRecipePage({super.key});

  @override
  ConsumerState<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends ConsumerState<CreateRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _cookTimeCtrl = TextEditingController();
  final _servingsCtrl = TextEditingController(text: '2');
  final List<_IngredientControllers> _ingredients = [_IngredientControllers()];
  final List<TextEditingController> _steps = [TextEditingController()];

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    _cookTimeCtrl.dispose();
    _servingsCtrl.dispose();
    for (final i in _ingredients) {
      i.dispose();
    }
    for (final s in _steps) {
      s.dispose();
    }
    super.dispose();
  }

  void _addIngredient() =>
      setState(() => _ingredients.add(_IngredientControllers()));

  void _removeIngredient(int index) {
    if (_ingredients.length == 1) return;
    final removed = _ingredients[index];
    setState(() => _ingredients.removeAt(index));
    // The row's TextFields still hold the controllers until the next frame.
    WidgetsBinding.instance.addPostFrameCallback((_) => removed.dispose());
  }

  void _addStep() => setState(() => _steps.add(TextEditingController()));

  void _removeStep(int index) {
    if (_steps.length == 1) return;
    final removed = _steps[index];
    setState(() => _steps.removeAt(index));
    WidgetsBinding.instance.addPostFrameCallback((_) => removed.dispose());
  }

  String? _required(String? value) =>
      (value == null || value.trim().isEmpty) ? 'Required' : null;

  String? _positiveInt(String? value) {
    final parsed = int.tryParse(value?.trim() ?? '');
    return (parsed == null || parsed <= 0) ? 'Enter a number' : null;
  }

  void _publish() {
    if (!_formKey.currentState!.validate()) return;
    final author = ref.read(currentProfileProvider);
    if (author == null) return;

    final recipe = Recipe(
      name: _titleCtrl.text.trim(),
      imageUrl: TestNetworkImages.pasta,
      durationMinutes: int.parse(_cookTimeCtrl.text.trim()),
      author: author,
      description: _descriptionCtrl.text.trim(),
      comments: 0,
      createdAt: DateTime.now(),
      servings: int.parse(_servingsCtrl.text.trim()),
      ingredients: _ingredients
          .map((i) => Ingredient(i.amount.text.trim(), i.name.text.trim()))
          .toList(),
      steps: _steps.map((s) => s.text.trim()).toList(),
    );
    ref.read(communityRecipesProvider.notifier).add(recipe);

    final messenger = ScaffoldMessenger.of(context);
    context.pop();
    messenger.showSnackBar(const SnackBar(content: Text('Recipe published!')));
  }

  @override
  Widget build(BuildContext context) {
    Widget header = Row(
      children: [
        const BackBtn(),
        const GapH(16),
        MyText('New Recipe', ms.pop18w600TextPrime),
      ],
    );

    Widget current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GapTop(size: 24),
        header,
        const GapV(24),
        const _CoverPhotoPlaceholder(),
        const GapV(24),
        MyTextField(
          label: 'Title',
          hint: 'e.g. Spaghetti Carbonara',
          controller: _titleCtrl,
          validator: _required,
        ),
        const GapV(16),
        MyTextField(
          label: 'Description',
          hint: 'What makes this recipe special?',
          controller: _descriptionCtrl,
          validator: _required,
          maxLines: 4,
        ),
        const GapV(16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MyTextField(
                label: 'Cook time (min)',
                hint: '30',
                controller: _cookTimeCtrl,
                validator: _positiveInt,
                keyboardType: TextInputType.number,
              ),
            ),
            const GapH(16),
            Expanded(
              child: MyTextField(
                label: 'Servings',
                hint: '2',
                controller: _servingsCtrl,
                validator: _positiveInt,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const GapV(32),
        _SectionHeader(title: 'Ingredients', onAdd: _addIngredient),
        const GapV(12),
        for (final (i, controllers) in _ingredients.indexed) ...[
          _IngredientRow(
            key: ObjectKey(controllers),
            controllers: controllers,
            validator: _required,
            onRemove: () => _removeIngredient(i),
          ),
          const GapV(12),
        ],
        const GapV(20),
        _SectionHeader(title: 'Steps', onAdd: _addStep),
        const GapV(12),
        for (final (i, controller) in _steps.indexed) ...[
          _StepRow(
            key: ObjectKey(controller),
            index: i,
            controller: controller,
            validator: _required,
            onRemove: () => _removeStep(i),
          ),
          const GapV(12),
        ],
        const GapV(24),
        Button.pinkMainTH20(text: 'Publish', onTap: _publish),
        const GapBottom(),
      ],
    );
    current = HPadding(24, current);
    current = Form(key: _formKey, child: current);
    current = SingleChildScrollView(child: current);
    return current;
  }
}

class _IngredientControllers {
  final amount = TextEditingController();
  final name = TextEditingController();

  void dispose() {
    amount.dispose();
    name.dispose();
  }
}

class _CoverPhotoPlaceholder extends StatelessWidget {
  const _CoverPhotoPlaceholder();

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.photo_camera_outlined, color: mc.pinkMain, size: 40),
        const GapV(8),
        MyText('Add cover photo', ms.pop14w400PinkMain),
      ],
    );
    current = Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: mc.pinkMain.opacityTo(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mc.pinkMain.opacityTo(0.5), width: 1.5),
      ),
      child: current,
    );
    // No image picker dependency yet; published posts use a placeholder image.
    current = GestureDetector(
      onTap: () => ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Photo upload coming soon'))),
      child: current,
    );
    return current;
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onAdd});
  final String title;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(title, ms.pop20w600PinkMain),
        const GapH.spacer(8),
        MyText('+ Add', ms.pop14w600PinkMain, onTap: onAdd),
      ],
    );
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Widget current = Icon(Icons.close_rounded, color: mc.pinkMain, size: 20);
    current = AllPadding(12, current);
    current = GestureDetector(onTap: onTap, child: current);
    return current;
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow({
    super.key,
    required this.controllers,
    required this.validator,
    required this.onRemove,
  });
  final _IngredientControllers controllers;
  final String? Function(String?) validator;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: MyTextField(hint: '100g', controller: controllers.amount),
        ),
        const GapH(8),
        Expanded(
          flex: 3,
          child: MyTextField(
            hint: 'Ingredient',
            controller: controllers.name,
            validator: validator,
          ),
        ),
        _RemoveButton(onTap: onRemove),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    super.key,
    required this.index,
    required this.controller,
    required this.validator,
    required this.onRemove,
  });
  final int index;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    Widget number = MyCircleBox(
      color: mc.pinkMain,
      size: 28,
      child: MyText.center('${index + 1}', ms.pop13w700TextPrime),
    );
    number = UpPadding(12, number);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        number,
        const GapH(12),
        Expanded(
          child: MyTextField(
            hint: 'Describe this step',
            controller: controller,
            validator: validator,
            maxLines: 3,
          ),
        ),
        _RemoveButton(onTap: onRemove),
      ],
    );
  }
}
