const std = @import("std");
const Pkg = std.build.Pkg;
const FileSource = std.build.FileSource;

pub const pkgs = struct {
    pub const requestz = Pkg{
        .name = "requestz",
        .source = FileSource{
            .path = ".gyro/requestz-devins2518-github.com-da32d03a/pkg/src/main.zig",
        },
        .dependencies = &[_]Pkg{
            Pkg{
                .name = "http",
                .source = FileSource{
                    .path = ".gyro/http-ducdetronquito-0.1.4-astrolabe.pm/pkg/src/main.zig",
                },
            },
            Pkg{
                .name = "iguanaTLS",
                .source = FileSource{
                    .path = ".gyro/iguanaTLS-nektro-github.com-09d9fe92/pkg/src/main.zig",
                },
            },
            Pkg{
                .name = "network",
                .source = FileSource{
                    .path = ".gyro/zig-network-MasterQ32-github.com-16f7e71a/pkg/network.zig",
                },
            },
            Pkg{
                .name = "h11",
                .source = FileSource{
                    .path = ".gyro/h11-devins2518-github.com-9750f686/pkg/src/main.zig",
                },
                .dependencies = &[_]Pkg{
                    Pkg{
                        .name = "http",
                        .source = FileSource{
                            .path = ".gyro/http-ducdetronquito-0.1.4-astrolabe.pm/pkg/src/main.zig",
                        },
                    },
                },
            },
            Pkg{
                .name = "apple_pie",
                .source = FileSource{
                    .path = ".gyro/apple_pie-Luukdegram-github.com-55b25cf5/pkg/src/apple_pie.zig",
                },
            },
        },
    };

    pub fn addAllTo(artifact: *std.build.LibExeObjStep) void {
        artifact.addPackage(pkgs.requestz);
    }
};

pub const exports = struct {
    pub const zheets = Pkg{
        .name = "zheets",
        .source = FileSource{ .path = "zheets/src/gen.zig" },
        .dependencies = &[_]Pkg{
            pkgs.requestz,
        },
    };
};
