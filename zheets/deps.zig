const std = @import("std");
const Pkg = std.build.Pkg;
const FileSource = std.build.FileSource;

pub const pkgs = struct {
    pub const requestz = Pkg{
        .name = "requestz",
        .source = FileSource{
            .path = "../../requestz/src/main.zig",
        },
        .dependencies = &[_]Pkg{
            Pkg{
                .name = "http",
                .source = FileSource{
                    .path = ".gyro/http-ducdetronquito-0.1.4-astrolabe.pm/pkg/src/main.zig",
                },
            },
            Pkg{
                .name = "h11",
                .source = FileSource{
                    .path = "../../h11/src/main.zig",
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
                .dependencies = &[_]Pkg{
                    Pkg{
                        .name = "http",
                        .source = FileSource{
                            .path = ".gyro/http-ducdetronquito-0.1.4-astrolabe.pm/pkg/src/main.zig",
                        },
                    },
                },
            },
        },
    };

    pub const @"zoogle-api" = Pkg{
        .name = "zoogle-api",
        .source = FileSource{
            .path = "../src/main.zig",
        },
    };

    pub fn addAllTo(artifact: *std.build.LibExeObjStep) void {
        artifact.addPackage(pkgs.requestz);
        artifact.addPackage(pkgs.@"zoogle-api");
    }
};
