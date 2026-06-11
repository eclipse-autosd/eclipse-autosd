#i Contributing to Eclipse AutoSD;

Thank you for your interest in Eclipse AutoSD.

## Project description

[Eclipse Automotive Integration for AutoSD](https://projects.eclipse.org/projects/automotive.autosd)  uses an AutoSD image, built and tailored for its community, to run and test both Eclipse SDV projects and blueprints.

Eclipse Automotive Integration for AutoSD offers a foundation for projects to build, run and test their stack, components and services, including blueprints.

The image setup will expose projects into thinking how their projects or blueprints would work in an Mixed Critical Orchestration[0]  architecture.

Several upstream tools from the CentOS Automotive SIG can used, from building images[1] to performance testing[2], but this integration project could also provide its own set of specialized tools for Eclipse SDV, to ease the process of deploying blueprints into this reference AutoSD image and so on.

## Testing

Our development images can be found in GitHub:

* https://github.com/orgs/eclipse-autosd/packages?repo_name=eclipse-autosd
* https://github.com/eclipse-autosd/eclipse-autosd/releases/tag/dev

They can be tested with the usual tools of choice: docker/podman for OCI images and QEMU for qcow2 ones. There's also a RPI4 image
that can be used directly with an RPI4 board.

## Found a bug or documentation issue?

To submit a bug or suggest an enhancement please use [GitHub issues](https://github.com/eclipse-autosd/eclipse-autosd/issues).

## Submitting patches

Patches are welcome!

Please submit patches to [github.com/eclipse-autosd/eclipse-autosd](https://github.com/eclipse-autosd/eclipse-autosd).
More information about the development can be found in [README.developer.md](README.developer.md).

You can read [Get started with GitHub](https://docs.github.com/en/get-started)
if you are not familiar with the development process to learn more about it.

## Developer resources

Information regarding source code management, builds, coding standards, and
more can be found in the [README.developer.md](./README.developer.md).

## Eclipse Contributor Agreement

In order to be able to contribute to Eclipse Foundation projects you must
electronically sign the [Eclipse Contributor Agreement (ECA)](https://www.eclipse.org/legal/ECA.php).

The ECA provides the Eclipse Foundation with a permanent record that you agree
that each of your contributions will comply with the commitments documented in
the Developer Certificate of Origin (DCO). Having an ECA on file associated with
the email address matching the "Author" field of your contribution's Git commits
fulfills the DCO's requirement that you sign-off on your contributions.

For more information, please see the [Eclipse Committer Handbook](https://www.eclipse.org/projects/handbook/#resources-commit)

## Need help?

If you need help, please join the following mailing lists:

- [Eclipse BlueChi development](https://accounts.eclipse.org/mailing-list/autosd-dev)
- [CentOS Automotive SIG](https://lists.centos.org/postorius/lists/automotive-sig.lists.centos.org/)
