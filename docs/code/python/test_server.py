import pytest
import testinfra

def test_nginx(host):
    "Checks if Nginx is running, installed and enabled for startup."
    assert host.package("nginx").is_installed
    assert host.service("nginx").is_running
    assert host.service("nginx").is_enabled

def test_mariadb(host):
    "Checks if Mariadb/MySQL is running, installed and enabled for startup."
    assert host.package("mariadb-server").is_installed
    assert host.service("mariadb").is_running
    assert host.service("mariadb").is_enabled

def test_python3(host):
    "Checks if Python is installed."
    assert host.package("python3").is_installed

def test_sshguard(host):
    "Check SSHguard installation"
    assert host.package("sshguard").is_installed

def test_integrit(host):
    "Check for Integrit installation"
    assert host.package("integrit").is_installed

def test_docker(host):
    "Verify Docker is running, installed and enabled for startup."
    assert host.package("docker").is_installed
    assert host.service("docker").is_running
    assert host.service("docker").is_enabled

def test_libmariadb_dev(host):
    "Checks for libmariadb-dev installation"
    assert host.package("libmariadb-dev").is_installed

def check_files(host):
    
