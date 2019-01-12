function blkStruct=slblocks
% SLBLOCKS Defines the Simlink block representation
blkStruct.Name=['quadratic' sprintf('\n') 'Blockset'];
blkStruct.OpenFcn='quadratic';
blkStruct.MaskInitialization='';
blkStruct.MaskDisplay='disp(''quadratic Blockset'')';

Browser(1).Library='quadratic';
Browser(1).Name = 'Quadratic Blockset';

blkStruct.Browser=Browser;
