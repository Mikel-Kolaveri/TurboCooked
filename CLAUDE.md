# TurboCooked — Claude Guidelines

Flutter recipe app targeting iOS and Android. Features auth, community posts, and social interactions.

## State management
Prefer Riverpod. `setState` is fine for purely local ephemeral UI state (e.g. toggle visibility, animation flags) but anything shared or persistent belongs in a Riverpod provider.

## Navigation
Always use GoRouter and the `Routes` class. Never use `Navigator.push` directly.

## Comments
Only add a comment when the WHY is non-obvious — a hidden constraint, a workaround, a subtle invariant. Don't explain what the code does.

## Design system
- Follow the existing `pop{size}w{weight}{color}` naming convention in `MyStyles` when adding new text styles. Don't suggest renaming existing styles.
- Follow `mc.` color names from `MyColors` for all colors. No raw `Color(0x...)` or `Colors.*` unless `MyColors` has no equivalent.
- Use `.opacityTo(double)` from `lib/extensions/color_extension.dart` for color opacity. Never use `.withOpacity()` or `.withValues(alpha:)` directly.

## Widget conventions

**`current =` pattern** — build widgets by layering onto a single `current` variable rather than nesting. Wrap outward, return at the end:
```dart
Widget current = Text('hello');
current = Padding(padding: EdgeInsets.all(8), child: current);
current = ColoredBox(color: Colors.red, child: current);
return current;
```

**Project wrapper widgets** exist to shorten verbose Flutter widget names and reduce repetition for commonly-used patterns. Use them when they cover the use case:
- `MyText` / `MyText.center` — wraps `Text` with style + tap + overflow
- `GapV` / `GapH` / `GapTop` / `GapBottom` — vertical/horizontal spacing
- `GapV.spacer` / `GapH.spacer` — `Expanded(child: SizedBox(...))`
- `HPadding` / `VPadding` / `AllPadding` / `UpPadding` / `DownPadding` / `LeftPadding` / `RightPadding` — directional padding shorthands
- `MyCircleBox` — `DecoratedBox` with `BoxShape.circle`

When adding new wrappers, follow the same principle: shorten a verbose or frequently-repeated Flutter pattern.

## Git
Always ask for confirmation before creating a commit.

## File structure
- New pages → `lib/pages/core_app/<feature>/`
- New shared widgets → `lib/widgets/`
- Sub-widgets: prefer private classes in the same file. Only split into a new file if the widget grows large or is reused elsewhere.
