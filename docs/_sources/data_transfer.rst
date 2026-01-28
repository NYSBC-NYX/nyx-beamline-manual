.. data_transfer:

Data Transfer
=============

All user data is written to central storage. Access to your data requires
authentication using your BNL domain account. If your BNL guest appointment
expires, you will lose access to your data and will then have to renew your
guest appointment.

Data can be downloaded using either Globus or with sftp.

NSLS-II now offers a new-and-improved Globus endpoint, conveniently accessible in your
web browser at `globus.nsls2.bnl.gov <https://globus.nsls2.bnl.gov>`_.


Downloading data
----------------

SFTP Client
~~~~~~~~~~~

You will need an sftp client.

+ **Cross-platform:** `FileZilla <https://filezilla-project.org/>`__.
  This is a free program available for Windows, Apple, and Linux.  The
  explanation below will be made using FileZilla.

+ **Windows users:** A popular option is `WinSCP
  <https://winscp.net/eng/index.php>`__. Be careful at the WinSCP
  website.  You will see multiple pop-up adds with download links to
  other software packages.  Be careful to click on the link to the
  WinSCP package.

+ **Mac users:** Other options are `Termius
  <https://termius.com/download/macos>`__
  and `Flow <http://fivedetails.com/flow/>`__.

+ **Linux users:** Your desktop file manager likely has an sftp client
  built in.  Try typing
  ``sftp://<username>@sftp.nsls2.bnl.gov`` into your file
  manager or create a new network drive using ``ssh`` and
  ``sftp.nsls2.bnl.gov``.

  `sshfs <https://github.com/libfuse/sshfs>`__ is an
  excellent solution.  ``sshfs`` allows you to easily
  mount the remote sftp site to a local mount point,
  allowing you to browse the remote site as if it were a
  local folder.  For example, the following can be done to mount
  the data folder locally:

  .. code-block:: bash

     sshfs johndoe@sftp.nsls2.bnl.gov:/nsls2/data/nyx ~/mnt/nyx -o follow_symlinks

  and this to unmount the data folder

  .. code-block:: bash

     fusermount -u mnt/nyx



The Short Version
~~~~~~~~~~~~~~~~~


.. admonition:: Executive Summary

   #. Connect to sftp.nsls2.bnl.gov in your sftp client
   #. Authenticate using your BNL username/password and DUO two-factor
      authentication
   #. Navigate to ``/nsls2/data/nyx/proposals/``, then to the cycle
      folder corresponding to the date of your experiment, then to the
      folder with your proposal number.  So, something like
      ``/nsls2/data/nyx/proposals/2026-1/pass-123456``.
   #. Transfer your data to your local computer.


Accessing data with Globus
--------------------------

.. admonition:: Note

    Your institution may block Globus as part of their IT policy. If this is the
    case, you will need to work with your institute IT for a policy exception.

If an institutional endpoint is available, Globus may be the best option
for retrieving your data from NYX.

To use Globus, you must transfer data to a Globus endpoint to which you have
access. This endpoint can be institutionally managed or a personal endpoint on
your computer.

If you are transferring data to your computer, you will need to use
`Globus Connect Personal (GCP) <https://app.globus.org/collections/gcp>`__.
Follow the download and installation instructions and start an
instance of GCP on your computer.

Once you have identified either an institutional endpoint or you have
GCP running, point your web browser at http://globus.nsls2.bnl.gov/.

In the Globus file manager panel, navigate to your
proposal directory, which will be something like
``/nsls2/data/nyx/proposals/2026-1/pass-123456``, and
replace ``2026-1`` with the operations cycle of your visit to NYX and
replace ``123456`` with the proposal number of your experiment.

.. figure:: _images/globus.png
    :align: center
    :class: my-5

    Globus navigation at NSLS-II


In the local panel on the right side of the page, navigate to the
location to which you want to download your data.

Select the data (or data folder) you wish to download and hit the
start button above the remote folder.