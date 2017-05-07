import qbs
import qbs.Probes

Module {
    Depends { name: "cpp" }

    cpp.includePaths: {
        var paths = [];
        if (kf5Probe.found)
            paths.push(kf5Probe.path);
        if (kwalletProbe.found)
            paths.push(kwalletProbe.path);
        return paths;
    }
    cpp.libraryPaths: {
        var paths = [];
        if (libProbe.found)
            paths.push(libProbe.path);
        return paths;
    }
    cpp.dynamicLibraries: {
        var libs = [];
        if (libProbe.found)
            libs.push(libProbe.filePath);
        return libs;
    }

    Probes.IncludeProbe {
        id: kf5Probe
        pathSuffixes: "include/KF5"
        names: ["kwallet_version.h"]
    }

    Probes.IncludeProbe {
        id: kwalletProbe
        pathSuffixes: "include/KF5/KWallet"
        names: ["kwallet_export.h"]
    }

    Probes.PathProbe {
        id: libProbe
        platformPaths: ["/usr/local/lib", "/usr/lib"]
        names: ["libKF5Wallet.so"]
    }
}
