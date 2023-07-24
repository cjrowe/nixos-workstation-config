# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "thunderbolt" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "zroot/nixos/root";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "zroot/nixos/home";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "zroot/nixos/nix";
      fsType = "zfs";
    };

  fileSystems."/var" =
    { device = "zroot/nixos/var";
      fsType = "zfs";
    };

  fileSystems."/var/log" =
    { device = "zroot/nixos/var/log";
      fsType = "zfs";
    };

  fileSystems."/var/lib" =
    { device = "zroot/nixos/var/lib";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5D8B-C707";
      fsType = "vfat";
    };

  fileSystems."/boot-fallback" =
    { device = "/dev/disk/by-uuid/5DEB-67E5";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/nvme0n1p4"; randomEncryption.enable = true; }
      { device = "/dev/nvme1n1p4"; randomEncryption.enable = true; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp7s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}