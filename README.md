pack-it-forms-outpost-pacread
=============================

This is an integration module for
[pack-it-forms](https://github.com/pack-it-forms/pack-it-forms),
a browser-based forms system for packet radio, that allows it to be
used more-or-less transparently with the
[Outpost](https://www.outpostpm.org/index.php),
radio messaging application, alongside
[PacFORMS](https://www.scc-ares-races.org/pfpublic/pacforms.html),
an earlier browser-based forms package, by replacing the PacFORMs
pac-read executable.

This integration approach works and is the method currently in use
within LAARES. However work has started no an alternative integration
module that integrates with Outpost using the add-ons functionality
that has been added to Outpost. That method is expected to be more
robust and once it has been deployed and proven in use we expect this
integration to be obsolete.


Installation
------------

Using pack-it-forms with OutPost requires a few manual installation
steps.

To allow Outpost to open messages formatted by pack-it-forms, we make
a copy of the PacFORMS pac-read.exe program and replace it with a
wrapper program that knows how to open pack-it-forms forms and call
the original pac-read.exe for PacFORMS forms:

1. Download and extract the install archive of pack-it-forms for
   windows.  Recent zip archives are hosted at:

     http://www.picnicpark.org/keith/ham-radio/pack-it-forms/

   Unless you have a good reason to get an old version, select the
   most recent version, typically the last in the list.  The zip file
   contains a single directory called `pack-it-forms` with all
   required files.  It is recommended that you unpack the zip file in
   the root of the `C:\` drive so that the files will all be in
   `C:\pack-it-forms`.
2. If you have never installed pack-it-forms before, set the
   environment variable PACKITFORMS_BASE to the directory where you
   extracted pack-it-forms.  It is preferable to use a "User" variable
   instead of a "System" variable as generally multiple users should
   not use the same pack-it-forms directory.  If you are updating an
   existing installation and unpacking the files on top of the former
   location, this step can be skipped.
3. If you have never installed pack-it-forms before, copy the file:
   `C:\PacFORMS\exec\pac-read.exe` to
   `C:\PacFORMS\exec\pac-read-pacforms.exe`.  If you are updating an
   existing installation, this step isn't required unless PacFORMS has
   also been updated, overwriting the previously installed
   pack-it-forms version of `pac-read.exe`.  To determine whether this
   is the case, issue the command `C:\PacFORMS\exec\pac-read.exe
   --pack-it-forms-version` in a Windows Command Prompt shell.  If a
   version is printed out and you are returned to the command prompt,
   you should *not* copy `pac-read.exe` to `pac-read-pacforms.exe`.
   If you are prompted to enter a file, then you *do* need to make the
   copy.
4. Copy all the contents of the following directory
   `<pack-it-forms>\resources\scripts\pac-read\build\exe.win32-3.4` to
   the directory `C:\PacFORMS\exec`.  This will overwrite the
   `pac-read.exe` file that currently exists in that directory,
   replacing either the PacFORMS version or the earlier pack-it-forms
   version.  This new executable is a "frozen" python script (made
   with cx_Freeze) that requires support files in the same directory.
   The rest of the copied files are these support files.  None of them
   should overwrite any existing PacFORMS file.
5. Finally, for the replacement `pac-read.exe` program to work
   correctly you need to have `MSVCR100.dll` installed. This may be
   missing from the computer.  To determine if you need to install
   this DLL, open a Windows Command Prompt, change to the
   `C:\PacFORMS\exec` directory and run the command `pac-read.exe
   --pack-it-forms-version`.  If a version number is printed
   everything is fine.  If you get a pop-up window saying MSVCR100.dll
   is missing you need to install the 32-bit Microsoft Visual C++
   Redistributable Package.  Follow the instructions at the following
   URL to download and install the required package:
   `http://www.microsoft.com/en-gb/download/details.aspx?id=5555`.

The PacFORMS installer is not aware of pack-it-forms, so these steps
will likely be required every time PacFORMS is updated.

If you have never installed pack-it-forms before or Outpost has been
updated since it was last installed, you can enable creation of
pack-it-forms forms using Outpost's Form menu with the following
steps:

1. Locate the file launch.ini in the Outpost data directory.
2. Add an appropriately formatted line for each pack-it-form form you
   would like to create.  The format is the same as for PacFORMS
   but with the filename for the pack-it-forms form substituted.

The Outpost installer is not yet aware of pack-it-forms, so these
steps will likely be required every time Outpost is updated.

All the above steps can be reversed to remove pack-it-forms from your
Outpost and PacFORMS installation.

Using and Creating Forms
------------------------
Instructions for using (and creating) are included in the
[pack-it-forms](https://github.com/pack-it-forms/pack-it-forms)
project.

