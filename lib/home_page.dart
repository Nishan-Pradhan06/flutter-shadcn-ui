import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final square = SizedBox.square(
      dimension: 16,
      child: Center(
        child: SizedBox.square(
          dimension: 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.foreground,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
    final divider = ShadSeparator.horizontal(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: theme.colorScheme.muted,
    );
    return Scaffold(
      body: Column(children: [MenuItems(divider: divider, square: square)]),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.divider, required this.square});

  final ShadSeparator divider;
  final SizedBox square;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Center(
        child: ShadMenubar(
          selectOnHover: false,
          items: [
            ShadMenubarItem(
              items: [
                const ShadContextMenuItem(child: Text('New Tab')),
                const ShadContextMenuItem(child: Text('New Window')),
                const ShadContextMenuItem(
                  enabled: false,
                  child: Text('New Incognito Window'),
                ),
                divider,
                const ShadContextMenuItem(
                  trailing: Icon(LucideIcons.chevronRight),
                  items: [
                    ShadContextMenuItem(child: Text('Email Link')),
                    ShadContextMenuItem(child: Text('Messages')),
                    ShadContextMenuItem(child: Text('Notes')),
                  ],
                  child: Text('Share'),
                ),
                divider,
                const ShadContextMenuItem(child: Text('Print...')),
              ],
              child: const Text('File'),
            ),
            ShadMenubarItem(
              items: [
                const ShadContextMenuItem(child: Text('Undo')),
                const ShadContextMenuItem(child: Text('Redo')),
                divider,
                ShadContextMenuItem(
                  trailing: const Icon(LucideIcons.chevronRight),
                  items: [
                    const ShadContextMenuItem(child: Text('Search the web')),
                    divider,
                    const ShadContextMenuItem(child: Text('Find...')),
                    const ShadContextMenuItem(child: Text('Find Next')),
                    const ShadContextMenuItem(child: Text('Find Previous')),
                  ],
                  child: const Text('Find'),
                ),
                divider,
                const ShadContextMenuItem(child: Text('Cut')),
                const ShadContextMenuItem(child: Text('Copy')),
                const ShadContextMenuItem(child: Text('Paste')),
              ],
              child: const Text('Edit'),
            ),
            ShadMenubarItem(
              items: [
                const ShadContextMenuItem.inset(
                  child: Text('Always Show Bookmarks Bar'),
                ),
                const ShadContextMenuItem(
                  leading: Icon(LucideIcons.check),
                  child: Text('Always Show Full URLs'),
                ),
                divider,
                const ShadContextMenuItem.inset(child: Text('Reload')),
                const ShadContextMenuItem.inset(
                  enabled: false,
                  child: Text('Force Reload'),
                ),
                divider,
                const ShadContextMenuItem.inset(
                  child: Text('Toggle Full Screen'),
                ),
                divider,
                const ShadContextMenuItem.inset(child: Text('Hide Sidebar')),
              ],
              child: const Text('View'),
            ),
            GestureDetector(
              onTap: () {
                showShadSheet(
                  side: ShadSheetSide.right,
                  context: context,
                  builder:
                      (context) => EditProfileSheet(side: ShadSheetSide.right),
                );
              },
              child: AbsorbPointer(
                child: ShadMenubarItem(
                  items: [],
                  child: const Text('Profiles'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileSheet extends StatelessWidget {
  EditProfileSheet({super.key, required this.side});

  final profile = [
    (title: 'Name', value: 'Nishan Pradhan'),
    (title: 'Username', value: 'nishan-pradhan06'),
  ];
  final ShadSheetSide side;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return SafeArea(
      child: ShadSheet(
        constraints:
            side == ShadSheetSide.left || side == ShadSheetSide.right
                ? const BoxConstraints(maxWidth: 510)
                : null,
        title: const Text('Edit Profile'),
        description: const Text(
          "Make changes to your profile here. Click save when you're done",
        ),
        actions: const [ShadButton(child: Text('Save changes'))],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
                profile
                    .map(
                      (p) => Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              p.title,
                              textAlign: TextAlign.end,
                              style: theme.textTheme.small,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 8,
                            child: ShadInput(initialValue: p.value),
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
