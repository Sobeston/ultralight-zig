const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    var exe = b.addExecutable("ultralight-test", "main.zig");
    b.exe_dir = "";

    exe.linkLibC();

    exe.addIncludeDir("ultralight\\include");
    exe.addLibPath("ultralight\\lib");

    exe.linkSystemLibrary("Ultralight");
    exe.linkSystemLibrary("UltralightCore");
    exe.linkSystemLibrary("AppCore");
    exe.linkSystemLibrary("WebCore");

    exe.install();
    b.default_step.dependOn(&exe.step);
}
