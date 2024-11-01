# Firefox Vertical Tabs

Vertical tabs for Firefox, inspired by Edge. Works with Light theme, Dark
theme,and System theme (auto dark mode). There are some minor glitches with
Alpenglow, but they should be easy to fix.

It also plays nice with Container Tabs.

## Native Vertical Tabs
Starting with Firefox 130, Mozilla offered a native implementation of vertical
tabs via the sidebar. I think that with version 131 this implementation has
become good enough to be usable.

In order to use it, go to `about:config`, and set the keys `sidebar.revamp` and
`sidebar.verticalTabs` to `true`. This should enable the new sidebar with the
tabs feature. All other configurations can be done in the sidebar itself (by
clicking the little cog icon), including switching between vertical tabs and
horizontal tabs.

Activating the sidebar does remove the top tabs, but it does not hide the space
they take up, which is a bit annoying. You can do that with a small CSS hack.

```css
#TabsToolbar:not([customizing="true"]) {
    visibility: collapse !important;
}
```

I have added a `userChrome-hideTopBarOnly.css` file which contains only this. To
use it, either copy it into the usual folder and rename it to `userChrome.css`
or use a symlink like this:

```sh
ln -s /path/to/userChrome-hideTopBarOnly.css /home/you/.mozilla/firefox/xxx.default-release/chrome/userChrome.css
```

## Compatibility

**Tested compatibility with up to Firefox 131.**

It should work on newer versions as well unless there's any breaking changes in
how `userChrome.css` works.

I have only tested this for Linux and macOS. There might be some bugs on Windows
because the window decorations look different. I can't test this because I don't
have a Windows computer, but if you find any bugs and know how to fix it, feel
free to submit a PR.

## Backends

From version 7.0 on, this project uses
[Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/) as the
backend instead of Tab Center Reborn. Sidebery is a bit more involved to setup,
but does offer more features, and, more importantly, is easier to modify using
CSS and does not have the payload size problem we were facing with TCR.

That means, you don't need minified files anymore.

If for some reason Sidebery does not work for you, stick to [version
6.5](https://codeberg.org/ranmaru22/firefox-vertical-tabs/releases/tag/v6.5) for
now.

## How to install

### General

-   Go to `about:config` in your URL bar, search for
    `toolkit.legacyUserProfileCustomizations.stylesheets` and set it to `true`.
-   Go to `about:profiles` in your URL bar, click *"Open Directory"* next to
    your Root Directory under your default profile.
-   If there is no `chrome` folder, create it.
-   Create a file called `userChrome.css` inside the `chrome` folder.
-   Copy and paste the contents of `userChrome.css` into your file (or symlink
    it).
-   OPTIONAL: Adjust settings in the `userChrome.css` file.
-   Install the
    [Sideberry](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)
    extension.
-   Make sure to enable *"Allow this extension to run in Private windows"* so
    you're not left stranded while browsing.
-   Open the Sideberry settings and make the following adjustments:
    -   **Navigation bar -\> Layout**: "horizontal" or "hidden"
    -   **Tabs -\> Pinned tabs -\> Pinned tabs position**: "in panel - top" or
        "globally - top"
-   Go to **Styles editor** and paste the contents of `sideberry.css` into the
    text area on the right.

Restart Firefox and you're done.

## Things to note

-   If the sidebar does not show up, you can press `Ctrl-E` to show Sideberry's
    sidebar, or `Cmd-B` / `Ctrl-B` to toggle the sidebar in general.
-   If your window controls are not correctly aligned, disable compact mode at
    `Customize toolbar...` menu.
