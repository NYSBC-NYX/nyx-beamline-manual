.. data_collection:

Data Collection at NYX
=================

This section describes the data collection process at NYX. It includes information on how to prepare for your experiment,
how to collect data, and how to troubleshoot common issues.


.. admonition:: Forms
   :class: tip

   Prior to the experiment, users will need to return the completed user information form as well
   as the sample spreadsheet to the beamline staff. Both forms are available to download
   from this website.


Safety Approval Form
--------------------

A valid safety approval form is required for all experiments at NYX and is a requirement for operation by NSLS-II.

The SAF system can be accessed through the PASS website at `PASS <https://pass.bnl.gov>`_.

It is the user's responsibility to ensure that the SAF is submitted and approved prior to the start of the experiment.
The SAF should be submitted at least 2 weeks prior to the experiment.

Users should submit an 'Envelope SAF' and not a 'Standard SAF'.

User Information Form
---------------------

Click here to download the :download:`User Information Form <_downloads/Remote_User_Info_NYX_v2.docx>`.

Please fill out the form and return it to the beamline staff prior to your experiment.


.. admonition:: Note
    :class: danger

    It is critical that all users that will be connecting remotely be listed on this form. This list is used
    by NYX staff to enable remote access for the users. If a user is not listed on this form, they will not be able to
    connect remotely.


.. admonition:: Note
    :class: important

    This list is also used to set directory permissions for NYSBC members. If a user is not listed, they will not be able to access the
    data collected from the experiment.


Sample Spreadsheet
------------------
Click here to download the :download:`Sample Spreadsheet <_downloads/nyx_spreadsheet_v1.0.xlsx>`.

The sample spreadsheet is used to specify file and directory names, specify the location of samples in pucks
and provide specific information for downstream processing.

.. admonition:: General requirements
    :class: important

    -  No spaces are permitted with the exception of column 'P'.
    -  The only special characters allowed are underscores (_), hyphens (-) and periods (.).
    -  Any other alphanumeric character is allowed.
    -  The sample name in column 'C' must be unique for each sample in the spreadsheet.
    -  The minium columns required a A, B, C and D. All other columns are optional.


Column Descriptions
~~~~~~~~~~~~~~~~~~~


:Col A (puckName): The name of the puck in which the sample is located. This will be the base name for data
  directories during collection. The puck name must be unique for each puck in the spreadsheet.

:Col B (position): The position of the sample in the puck. This is a number from 1 to 16. The position must be unique
  for each sample in the puck.

:Col C (sampleName): The name of the sample. This will be the base name for data files during collection. The sample
  name must be unique for each sample in the spreadsheet and not exceed 25 characters.

:Col D (proposalNum): The proposal number assigned in PASS for the experiment. This will determine if the samples are
  available to you in the software. It is critical that you have your correct proposal number in this column.

:Col E (folder): An alternate folder name for the data. **We do not recommend using this column.**

:Col F (deltaPhi): The angular increment in degrees for automated data collection.

:Col G (exposure): The exposure time in seconds for automated data collection.

:Col H (totalPhi): The total angular range in degrees for automated data collection.

:Col I (transmission): The percent transmission for automated data collection. This is a number between 0 and 100.

:Col J (targetResolution): The target resolution in Angstroms to the edge of the detector for automated data collection.
  The detector will be set at this distance.

:Col K (beamSize): The limiting aperture to be used for automated data collection. This can be 10, 20, 30, 50 or 100.
  We recommend using 20 or 30 for most samples.

:Col L (priority): The sample priority for automated data collection. This is a number starting at 1 for the highest
  priority. The sample with the lowest number (ie, the highest priority) will be collected first.

:Col M (collectionType): The type of data collection to be performed. This can be either 'screen' or 'collect'.
  Screen will only perform the first dimension grid scan and collect will perform the full data collection.

:Col N (model): This is the model to be used for molecular replacement. This can either be the 4-character PDB code
  or the name of a supplied model file. If you supply a model file, only put the base name of the file in this column (ie,
  'my_lysozyme' and not 'my_lysozyme.pdb'). The model file should be placed in the PDB_models directory in the proposal folder.

:Col O (spaceGroup): The space group of the crystal, if known. This should be the full H-M symbol or the numeric
  space group number. If the space group is not known, leave this column blank. **Currently not supported**

:Col P (cellParameters): The unit cell parameters of the crystal, if known. This should be in the format
  'a b c alpha beta gamma' with a space between each parameter. If the unit cell parameters are not known, leave this
  column blank. **Currently not supported**
