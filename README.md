# IntelliJ fsnotifier to ignore bazel cache directory

This builds a hacked version of `fsnotifier` that exclude the `.cache/bazel` directory from being indexed by Intelij. This helps a ton with project startup times and reindexing after builds, for a large mono-repo this reduced initial sync times by 30%.

The default destination directory is assumed to be `/usr/share/idea/bin` which is true for Arch Linux packages. When installing the existing `fsnotifier` binary will get backed up to `fsnotifier.orig`.

Use like this:
```bash
make
sudo make install
# if your system uses a different installation path
sudo make install DESTDIR=/opt/JetBrains/idea-IU-211.7142.45/bin
```

This is based on [this](https://github.com/nuzayets/intellij-fsNotifier-hack). For a good laugh see the discussion [here](https://youtrack.jetbrains.com/issue/IDEA-73309/When-a-folder-is-excluded-from-the-project-is-still-watched-with-inotify) on why this hack is necessary. 
