const std = @import("std");

const c = @cImport({
    @cInclude("Ultralight/CAPI.h");
    @cInclude("AppCore/CAPI.h");
});

pub fn main() void {
    const width = 1280;
    const height = 720;

    const app = c.ulCreateApp(c.ulCreateSettings(), c.ulCreateConfig());
    const monitor = c.ulAppGetMainMonitor(app);
    const window = c.ulCreateWindow(monitor, width, height, false, 0);
    c.ulAppSetWindow(app, window);
    const renderer = c.ulAppGetRenderer(app);
    var view = c.ulCreateView(renderer, width, height, false);
    const overlay = c.ulCreateOverlay(window, width, height, 0, 0);
    view = c.ulOverlayGetView(overlay);
    c.ulViewLoadURL(view, c.ulCreateString("https://google.com/"));
    c.ulAppRun(app);
}
