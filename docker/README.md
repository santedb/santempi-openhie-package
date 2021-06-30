# SanteMPI Docker Container for Instant OpenHIE

This container will spin up an empty docker container running SanteMPI with the following service enabled. 

A full list of configuration options can be found on the [Docker Container Wiki](https://help.santesuite.org/santedb/installation/santedb-server/docker-containers/feature-configuration)

## Volumes

When starting up this container, it will expose these volumes on the host:

* **santedb-mpi-seed** : Which contains data-seeding files. You can drop your own [Dataset Files](https://help.santesuite.org/santedb/extending-santedb/applets/distributing-data) into this volume and restart the container to seed your data. Alternately you can drop the files from the sample-data directory in here to seed with Elbonia MPI data
* **santedb-mpi-config** : If you need to access the underlying [Configuration Files](https://help.santesuite.org/santedb/operations/host-administration/host-configuration-file) this can be done in the directory
* **santedb-mpi-apps** : If you wish to add custom BI reports, business rules (like generating health IDs, assigning addresses, etc.) you can drop your compiled (and signed) PAK files generated from the [SanteDB SDK](https://github.com/santedb/santedb-sdk) here. Some useful references on [Applet Files](https://help.santesuite.org/santedb/extending-santedb/applets):
   * [Custom BI Resources](https://help.santesuite.org/santedb/extending-santedb/applets/business-intelligence-bi-assets) - Which will be used (in future releases) to generate `MeasureReport` data as well as reports.
   * [Custom Business Rules](https://help.santesuite.org/santedb/extending-santedb/applets/business-rules) - Which allow for altering the core behavior of the MPI/CDR
   * [Packaging Applets](https://help.santesuite.org/santedb/extending-santedb/applets/packaging-applets) - Which allow you to create the PAK files to be deployed into these volumes.