.. data_collection:

Data Collection at NYX
======================

This section describes the data collection process at NYX. It includes information on how to prepare for your experiment,
how to collect data, and how to troubleshoot common issues.


.. admonition:: Forms
   :class: tip

   Prior to the experiment, users will need to return the completed user information form as well
   as the sample spreadsheet to the beamline staff. Both forms are available to download
   from this website.


Administrative Paperwork
------------------------


Safety Approval Form
~~~~~~~~~~~~~~~~~~~~

A valid safety approval form is required for all experiments at NYX and is a requirement for operation by NSLS-II.

The SAF system can be accessed through the `PASS website <https://pass.bnl.gov>`_.

It is the user's responsibility to ensure that the SAF is submitted and approved prior to the start of the experiment.
The SAF should be submitted at least 2 weeks prior to the experiment.

Users should submit an 'Envelope SAF' and not a 'Standard SAF'.

User Information Form
~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~
Click here to download the :download:`Sample Spreadsheet <_downloads/nyx_spreadsheet_v2.xlsx>`.

The sample spreadsheet is used to specify file and directory names, specify the location of samples in pucks
and provide specific information for downstream processing.

.. admonition:: General requirements
    :class: important

    -  No spaces are permitted with the exception of columns 'P' and 'Q'.
    -  The only special characters allowed are underscores (_), hyphens (-) and periods (.).
    -  Any other alphanumeric character is allowed.
    -  The sample name in column 'C' must be unique for each sample in the spreadsheet.
    -  The minium columns required are A, B, C and D. All other columns are optional.


Column Descriptions
^^^^^^^^^^^^^^^^^^^


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
  space group number. If the space group is not known, leave this column blank. This only works for autoPROC.

:Col P (cellParameters): The unit cell parameters of the crystal, if known. This should be in the format
  'a b c alpha beta gamma' with a space between each parameter. If the unit cell parameters are not known, leave this
  column blank. If the cell is given in this column, the space group must also be given in column O. This only works for autoPROC.

:Col Q (autoprocCommands): Any additional command line options to be passed to autoPROC. Add items exactly as they would
  be typed on the command line.



Detector Geometry Calculator
----------------------------------

.. raw:: html

   <div style="background: #f9f9f9; border: 1px solid #ddd; padding: 20px; border-radius: 8px; max-width: 500px; font-family: sans-serif;">

       <!-- Mode Selection -->
       <div style="margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #ccc;">
           <label style="font-weight: bold; margin-right: 15px;">
               <input type="radio" name="calc-mode" value="resolution" checked onchange="toggleMode()"> Calculate Resolution
           </label>
           <label style="font-weight: bold;">
               <input type="radio" name="calc-mode" value="distance" onchange="toggleMode()"> Calculate Distance
           </label>
       </div>

       <!-- Shared Inputs -->
       <div style="margin-bottom: 12px;">
           <label style="display: block; font-weight: bold; margin-bottom: 4px;">Photon Energy (Energy in keV):</label>
           <input type="number" id="xray-energy" value="12.670" step="0.1" style="width: 100%; padding: 6px; box-sizing: border-box;" oninput="calculate()">
       </div>
       <div style="margin-bottom: 12px;">
           <label style="display: block; font-weight: bold; margin-bottom: 4px;">Detector:</label>
           <select id="xray-detector-select" style="width: 100%; padding: 6px; box-sizing: border-box;" onchange="handleDetectorChange()">
               <option value="50">Generic Small (Radius: 50)</option>
               <option value="150">Rayonix MX300 (Radius: 150)</option>
               <option value="163.6">Eiger2 XE 16M (Radius: 163.6)</option>
               <option value="122.3" selected>Eiger2 XE 9M (Radius: 122.3)</option>
               <option value="224">Pilatus 6M (Radius: 224)</option>
               <option value="other">Other (Custom Radius)</option>
           </select>

           <div id="other-radius-container" style="display: none; margin-top: 8px;">
               <label style="display: block; font-size: 0.9em; font-weight: bold; margin-bottom: 4px;">Custom Radius (R):</label>
               <input type="number" id="xray-radius-custom" value="100" step="1" style="width: 100%; padding: 6px; box-sizing: border-box;" oninput="calculate()">
           </div>
       </div>

       <!-- Mode-Specific Inputs/Outputs -->
       <div id="distance-input-container" style="margin-bottom: 12px;">
           <label style="display: block; font-weight: bold; margin-bottom: 4px;">Crystal-to-Detector Distance (Distance in mm):</label>
           <input type="number" id="xray-distance" value="150" step="1" style="width: 100%; padding: 6px; box-sizing: border-box;" oninput="calculate()">
       </div>

       <div id="resolution-input-container" style="margin-bottom: 12px; display: none;">
           <label style="display: block; font-weight: bold; margin-bottom: 4px;">Target Resolution (d_min in Å):</label>
           <input type="number" id="xray-target-resolution" value="1.5" step="0.1" style="width: 100%; padding: 6px; box-sizing: border-box;" oninput="calculate()">
       </div>

       <!-- Results Box -->
       <div style="margin-top: 15px; padding: 10px; background: #e8f4fd; border-radius: 4px; border: 1px solid #b6d4fe;">
           <div id="result-resolution">
               <strong>Calculated Resolution (d_min):</strong> <span id="xray-res-result" style="font-size: 1.2em; color: #003666; font-weight: bold;">--</span> Å
           </div>
           <div id="result-distance" style="display: none;">
               <strong>Required Distance (L):</strong> <span id="xray-dist-result" style="font-size: 1.2em; color: #003666; font-weight: bold;">--</span> mm
           </div>
           <div id="error-message" style="display: none; color: #842029; font-weight: bold;"></div>
       </div>
   </div>

   <script>
       function handleDetectorChange() {
           const select = document.getElementById('xray-detector-select');
           const customContainer = document.getElementById('other-radius-container');
           customContainer.style.display = select.value === 'other' ? 'block' : 'none';
           calculate();
       }

       function toggleMode() {
           const mode = document.querySelector('input[name="calc-mode"]:checked').value;

           if (mode === 'resolution') {
               document.getElementById('distance-input-container').style.display = 'block';
               document.getElementById('resolution-input-container').style.display = 'none';
               document.getElementById('result-resolution').style.display = 'block';
               document.getElementById('result-distance').style.display = 'none';
           } else {
               document.getElementById('distance-input-container').style.display = 'none';
               document.getElementById('resolution-input-container').style.display = 'block';
               document.getElementById('result-resolution').style.display = 'none';
               document.getElementById('result-distance').style.display = 'block';
           }
           calculate();
       }

       function calculate() {
           const hc = 12.3984; // keV * Angstroms
           const E = parseFloat(document.getElementById('xray-energy').value);
           const mode = document.querySelector('input[name="calc-mode"]:checked').value;
           const errorDiv = document.getElementById('error-message');

           // Hide error by default
           errorDiv.style.display = 'none';
           document.getElementById('result-resolution').style.display = mode === 'resolution' ? 'block' : 'none';
           document.getElementById('result-distance').style.display = mode === 'distance' ? 'block' : 'none';

           let R;
           const selectVal = document.getElementById('xray-detector-select').value;
           if (selectVal === 'other') {
               R = parseFloat(document.getElementById('xray-radius-custom').value);
           } else {
               R = parseFloat(selectVal);
           }

           if (E <= 0 || R <= 0 || isNaN(E) || isNaN(R)) {
               showError("Invalid Energy or Radius");
               return;
           }

           const lambda = hc / E;

           if (mode === 'resolution') {
               const L = parseFloat(document.getElementById('xray-distance').value);
               if (L <= 0 || isNaN(L)) {
                   showError("Invalid Distance");
                   return;
               }
               const thetaMax = 0.5 * Math.atan(R / L);
               const dMin = lambda / (2 * Math.sin(thetaMax));
               document.getElementById('xray-res-result').innerText = dMin.toFixed(4);

           } else if (mode === 'distance') {
               const dMin = parseFloat(document.getElementById('xray-target-resolution').value);
               if (dMin <= 0 || isNaN(dMin)) {
                   showError("Invalid Target Resolution");
                   return;
               }

               // Check if resolution is physically possible at this energy
               const sinTheta = lambda / (2 * dMin);
               if (sinTheta >= 1) {
                   showError("Resolution physically impossible at this energy (Increase Energy or Target d_min)");
                   return;
               }

               const thetaMax = Math.asin(sinTheta);
               const L = R / Math.tan(2 * thetaMax);
               document.getElementById('xray-dist-result').innerText = L.toFixed(2);
           }
       }

       function showError(msg) {
           document.getElementById('result-resolution').style.display = 'none';
           document.getElementById('result-distance').style.display = 'none';
           const errorDiv = document.getElementById('error-message');
           errorDiv.innerText = msg;
           errorDiv.style.display = 'block';
       }

       window.onload = function() {
           handleDetectorChange(); // Ensures correct initial state
       };
   </script>