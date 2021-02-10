use 5.008;

package Business::ISBN::Data;
use strict;

use Carp                  qw(carp);
use File::Basename        qw(dirname);
use File::Spec::Functions qw(catfile);

our $VERSION = '20210112.004';

=encoding utf8

=head1 NAME

Business::ISBN::Data - data pack for Business::ISBN

=head1 SYNOPSIS

see L<Business::ISBN>

=head1 DESCRIPTION

You don't need to load this module yourself in most cases. L<Business::ISBN>
will load it when it loads.

These data are generated from the F<RangeMessage.xml> file provided by
the ISBN Agency. The distributed version matches the date in the version
for this module. You can retrieve this yourself at L<https://www.isbn-international.org/range_file_generation>.
This file is included as part of the distribution and should be installed
at F<~lib/Business/ISBN/Data/RangeMessage.xml>.

If you want to use a different F<RangeMessage.xml> file, you can set
the C<ISBN_RANGE_MESSAGE> environment variable to the alternate location
before you load C<Business::ISBN>. This way, you can use the latest (or
even earlier) data without having to install something new or wait for
an update to this module.

If the default F<RangeMessage.xml> or your alternate one is not available,
the module falls back to data included in F<Data.pm>. However, that data
are likely to be older. If it does not find that file, it looks
for F<RangeMessage.xml> in the current directory.

The data are in C<%Business::ISBN::country_data> (although the "country"
part is historical). If you want to see where the data are from, check
C<$Business::ISBN::country_data{_source}>.

=head2 Packaging this module

The included F<RangeMessage.xml> is in under F<lib/> at the same level
as F<Data.pm>. The same data exist as the default data in the code, so
you don't need to pass along the distributed F<RangeMessage.xml>.
However, you can include a newer F<RangeMessage.xml>.

With PAR, you can add extra files to the archive with C<-a>. Put the
new file somewhere the module will find it (or use C<ISBN_RANGE_MESSAGE>
to lead it there):

	pp ... -a '..../RangeMessage.xml;RangeMessage.xml'

=head1 SOURCE AVAILABILITY

This module lives in a Github repository:

	https://github.com/briandfoy/business-isbn-data.git

You are probably also interested in the module that uses it:

	https://github.com/briandfoy/business-isbn.git

If you have something to add, create a fork on Github and send a
pull request.

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

Yakov Shafranovich updated the data in October 2008.

Daniel Jakubik updated the data in July 2012.

Markus Spann suggested looking for F<RangeMessage.xml> in the current
directory to make it work with Perl app bundlers.

Josef Moravec C<< <josef.moravec@gmail.com> >> updated the data in January 2019.

Peter Williams fixed a serious issue with ISBN-13 (GitHub #5)

=head1 COPYRIGHT AND LICENSE

Copyright © 2002-2021, brian d foy <bdfoy@cpan.org>. All rights reserved.

You may redistribute this under the terms of the Artistic License 2.0.

=cut

sub _default_data {
	(
	_data_date => '20120112',
	_serial    => '0c5e7d67-d086-48c1-80f9-55319988b0c0',
	_source    => __FILE__,
	978 => {
		0     => [ 'English language'             => [ '00', '19', '200', '227', '2280', '2289', '229', '368', '3690', '3699', '370', '638', '6390', '6397', '6398000', '6399999', '640', '644', '6450000', '6459999', '646', '647', '6480000', '6489999', '649', '654', '6550', '6559', '656', '699', '7000', '8499', '85000', '89999', '900000', '949999', '9500000', '9999999' ] ],
		1     => [ 'English language'             => [ '000', '009', '01', '02', '030', '034', '0350', '0399', '04', '06', '0700', '0999', '100', '397', '3980', '5499', '55000', '64999', '6500', '6799', '68000', '68599', '6860', '7139', '714', '716', '7170', '7319', '7320000', '7399999', '74000', '77499', '7750000', '7753999', '77540', '77639', '7764000', '7764999', '77650', '77699', '7770000', '7776999', '77770', '78999', '7900', '7999', '80000', '80049', '80050', '80499', '80500', '83799', '8380000', '8384999', '83850', '86719', '8672', '8675', '86760', '86979', '869800', '915999', '9160000', '9165059', '916506', '972999', '9730', '9877', '987800', '991149', '9911500', '9911999', '991200', '998989', '9989900', '9999999' ] ],
		2     => [ 'French language'              => [ '00', '19', '200', '349', '35000', '39999', '400', '489', '490000', '494999', '495', '495', '4960', '4966', '49670', '49699', '497', '699', '7000', '8399', '84000', '89999', '900000', '919799', '91980', '91980', '919810', '919942', '9199430', '9199689', '919969', '949999', '9500000', '9999999' ] ],
		3     => [ 'German language'              => [ '00', '02', '030', '033', '0340', '0369', '03700', '03999', '04', '19', '200', '699', '7000', '8499', '85000', '89999', '900000', '949999', '9500000', '9539999', '95400', '96999', '9700000', '9849999', '98500', '99999' ] ],
		4     => [ 'Japan'                        => [ '00', '19', '200', '699', '7000', '8499', '85000', '89999', '900000', '949999', '9500000', '9999999' ] ],
		5     => [ 'former U.S.S.R'               => [ '00000', '00499', '0050', '0099', '01', '19', '200', '420', '4210', '4299', '430', '430', '4310', '4399', '440', '440', '4410', '4499', '450', '603', '6040000', '6049999', '605', '699', '7000', '8499', '85000', '89999', '900000', '909999', '91000', '91999', '9200', '9299', '93000', '94999', '9500000', '9500999', '9501', '9799', '98000', '98999', '9900000', '9909999', '9910', '9999' ] ],
		7     => [ 'China, People\'s Republic'    => [ '00', '09', '100', '499', '5000', '7999', '80000', '89999', '900000', '999999' ] ],
		65    => [ 'Brazil'                       => [ '00', '01', '250', '299', '300', '302', '5000', '5129', '5500', '5999', '80000', '81824', '86000', '89999', '900000', '902449', '990000', '999999' ] ],
		80    => [ 'former Czechoslovakia'        => [ '00', '19', '200', '699', '7000', '8499', '85000', '89999', '900000', '998999', '99900', '99999' ] ],
		81    => [ 'India'                        => [ '00', '19', '200', '699', '7000', '8499', '85000', '89999', '900000', '999999' ] ],
		82    => [ 'Norway'                       => [ '00', '19', '200', '689', '690000', '699999', '7000', '8999', '90000', '98999', '990000', '999999' ] ],
		83    => [ 'Poland'                       => [ '00', '19', '200', '599', '60000', '69999', '7000', '8499', '85000', '89999', '900000', '999999' ] ],
		84    => [ 'Spain'                        => [ '00', '10', '1100', '1199', '120000', '129999', '1300', '1399', '140', '149', '15000', '19999', '200', '699', '7000', '8499', '85000', '89999', '9000', '9199', '920000', '923999', '92400', '92999', '930000', '949999', '95000', '96999', '9700', '9999' ] ],
		85    => [ 'Brazil'                       => [ '00', '19', '200', '454', '455000', '455299', '45530', '45599', '456', '528', '52900', '53199', '5320', '5339', '534', '539', '54000', '54029', '54030', '54039', '540400', '540499', '54050', '54089', '540900', '540999', '54100', '54399', '5440', '5479', '54800', '54999', '5500', '5999', '60000', '69999', '7000', '8499', '85000', '89999', '900000', '924999', '92500', '94499', '9450', '9599', '96', '97', '98000', '99999' ] ],
		86    => [ 'former Yugoslavia'            => [ '00', '29', '300', '599', '6000', '7999', '80000', '89999', '900000', '999999' ] ],
		87    => [ 'Denmark'                      => [ '00', '29', '400', '649', '7000', '7999', '85000', '94999', '970000', '999999' ] ],
		88    => [ 'Italy'                        => [ '00', '19', '200', '311', '31200', '31499', '315', '318', '31900', '32299', '323', '326', '3270', '3389', '339', '360', '3610', '3629', '363', '548', '5490', '5549', '555', '599', '6000', '8499', '85000', '89999', '900000', '909999', '910', '926', '9270', '9399', '940000', '947999', '94800', '99999' ] ],
		89    => [ 'Korea, Republic'              => [ '00', '24', '250', '549', '5500', '8499', '85000', '94999', '950000', '969999', '97000', '98999', '990', '999' ] ],
		90    => [ 'Netherlands'                  => [ '00', '19', '200', '499', '5000', '6999', '70000', '79999', '800000', '849999', '8500', '8999', '90', '90', '94', '94' ] ],
		91    => [ 'Sweden'                       => [ '0', '1', '20', '49', '500', '649', '7000', '8199', '85000', '94999', '970000', '999999' ] ],
		92    => [ 'International NGO Publishers and EU Organizations' => [ '0', '5', '60', '79', '800', '899', '9000', '9499', '95000', '98999', '990000', '999999' ] ],
		93    => [ 'India'                        => [ '00', '09', '100', '499', '5000', '7999', '80000', '94999', '950000', '999999' ] ],
		94    => [ 'Netherlands'                  => [ '000', '599', '6000', '8999', '90000', '99999' ] ],
		600   => [ 'Iran'                         => [ '00', '09', '100', '499', '5000', '8999', '90000', '98679', '9868', '9929', '993', '995', '99600', '99999' ] ],
		601   => [ 'Kazakhstan'                   => [ '00', '19', '200', '699', '7000', '7999', '80000', '84999', '85', '99' ] ],
		602   => [ 'Indonesia'                    => [ '00', '06', '0700', '1399', '14000', '14999', '1500', '1699', '17000', '19999', '200', '499', '50000', '53999', '5400', '5999', '60000', '61999', '6200', '6999', '70000', '74999', '7500', '9499', '95000', '99999' ] ],
		603   => [ 'Saudi Arabia'                 => [ '00', '04', '05', '49', '500', '799', '8000', '8999', '90000', '99999' ] ],
		604   => [ 'Vietnam'                      => [ '0', '4', '50', '89', '900', '979', '9800', '9999' ] ],
		605   => [ 'Turkey'                       => [ '00', '02', '030', '039', '04', '05', '06000', '06999', '07', '09', '100', '199', '2000', '2399', '240', '399', '4000', '5999', '60000', '74999', '7500', '7999', '80000', '89999', '9000', '9999' ] ],
		606   => [ 'Romania'                      => [ '000', '089', '09', '49', '500', '799', '8000', '9099', '910', '919', '92000', '96499', '9650', '9749', '975', '999' ] ],
		607   => [ 'Mexico'                       => [ '00', '39', '400', '749', '7500', '9499', '95000', '99999' ] ],
		608   => [ 'North Macedonia'              => [ '0', '0', '10', '19', '200', '449', '4500', '6499', '65000', '69999', '7', '9' ] ],
		609   => [ 'Lithuania'                    => [ '00', '39', '400', '799', '8000', '9499', '95000', '99999' ] ],
		611   => [ 'Thailand'                     => [  ] ],
		612   => [ 'Peru'                         => [ '00', '29', '300', '399', '4000', '4499', '45000', '49999', '5000', '5149' ] ],
		613   => [ 'Mauritius'                    => [ '0', '9' ] ],
		614   => [ 'Lebanon'                      => [ '00', '39', '400', '799', '8000', '9499', '95000', '99999' ] ],
		615   => [ 'Hungary'                      => [ '00', '09', '100', '499', '5000', '7999', '80000', '89999' ] ],
		616   => [ 'Thailand'                     => [ '00', '19', '200', '699', '7000', '8999', '90000', '99999' ] ],
		617   => [ 'Ukraine'                      => [ '00', '49', '500', '699', '7000', '8999', '90000', '99999' ] ],
		618   => [ 'Greece'                       => [ '00', '19', '200', '499', '5000', '7999', '80000', '99999' ] ],
		619   => [ 'Bulgaria'                     => [ '00', '14', '150', '699', '7000', '8999', '90000', '99999' ] ],
		620   => [ 'Mauritius'                    => [ '0', '9' ] ],
		621   => [ 'Philippines'                  => [ '00', '29', '400', '599', '8000', '8999', '95000', '99999' ] ],
		622   => [ 'Iran'                         => [ '00', '08', '200', '299', '6000', '7999', '95000', '99999' ] ],
		623   => [ 'Indonesia'                    => [ '00', '09', '200', '399', '6000', '7999', '90000', '99999' ] ],
		624   => [ 'Sri Lanka'                    => [ '00', '04', '200', '249', '5000', '5999', '95000', '99999' ] ],
		625   => [ 'Turkey'                       => [ '00', '00', '400', '449', '7000', '7999' ] ],
		950   => [ 'Argentina'                    => [ '00', '49', '500', '899', '9000', '9899', '99000', '99999' ] ],
		951   => [ 'Finland'                      => [ '0', '1', '20', '54', '550', '889', '8900', '9499', '95000', '99999' ] ],
		952   => [ 'Finland'                      => [ '00', '19', '200', '499', '5000', '5999', '60', '65', '6600', '6699', '67000', '69999', '7000', '7999', '80', '94', '9500', '9899', '99000', '99999' ] ],
		953   => [ 'Croatia'                      => [ '0', '0', '10', '14', '150', '479', '48000', '49999', '500', '500', '50100', '50999', '51', '54', '55000', '59999', '6000', '9499', '95000', '99999' ] ],
		954   => [ 'Bulgaria'                     => [ '00', '28', '2900', '2999', '300', '799', '8000', '8999', '90000', '92999', '9300', '9999' ] ],
		955   => [ 'Sri Lanka'                    => [ '0000', '1999', '20', '33', '3400', '3549', '35500', '35999', '3600', '3799', '38000', '38999', '3900', '4099', '41000', '44999', '4500', '4999', '50000', '54999', '550', '710', '71100', '71499', '7150', '9499', '95000', '99999' ] ],
		956   => [ 'Chile'                        => [ '00', '08', '09000', '09999', '10', '19', '200', '599', '6000', '6999', '7000', '9999' ] ],
		957   => [ 'Taiwan'                       => [ '00', '02', '0300', '0499', '05', '19', '2000', '2099', '21', '27', '28000', '30999', '31', '43', '440', '819', '8200', '9699', '97000', '99999' ] ],
		958   => [ 'Colombia'                     => [ '00', '48', '490', '509', '5100', '5199', '52000', '53999', '5400', '5599', '56000', '59999', '600', '799', '8000', '9499', '95000', '99999' ] ],
		959   => [ 'Cuba'                         => [ '00', '19', '200', '699', '7000', '8499', '85000', '99999' ] ],
		960   => [ 'Greece'                       => [ '00', '19', '200', '659', '6600', '6899', '690', '699', '7000', '8499', '85000', '92999', '93', '93', '9400', '9799', '98000', '99999' ] ],
		961   => [ 'Slovenia'                     => [ '00', '19', '200', '599', '6000', '8999', '90000', '95999' ] ],
		962   => [ 'Hong Kong, China'             => [ '00', '19', '200', '699', '7000', '8499', '85000', '86999', '8700', '8999', '900', '999' ] ],
		963   => [ 'Hungary'                      => [ '00', '19', '200', '699', '7000', '8499', '85000', '89999', '9000', '9999' ] ],
		964   => [ 'Iran'                         => [ '00', '14', '150', '249', '2500', '2999', '300', '549', '5500', '8999', '90000', '96999', '970', '989', '9900', '9999' ] ],
		965   => [ 'Israel'                       => [ '00', '19', '200', '599', '7000', '7999', '90000', '99999' ] ],
		966   => [ 'Ukraine'                      => [ '00', '12', '130', '139', '14', '14', '1500', '1699', '170', '199', '2000', '2789', '279', '289', '2900', '2999', '300', '699', '7000', '8999', '90000', '90999', '910', '949', '95000', '97999', '980', '999' ] ],
		967   => [ 'Malaysia'                     => [ '00', '00', '0100', '0999', '10000', '19999', '2000', '2499', '250', '254', '2800', '2999', '300', '499', '5000', '5999', '60', '89', '900', '989', '9900', '9989', '99900', '99999' ] ],
		968   => [ 'Mexico'                       => [ '01', '39', '400', '499', '5000', '7999', '800', '899', '9000', '9999' ] ],
		969   => [ 'Pakistan'                     => [ '0', '1', '20', '20', '210', '219', '2200', '2299', '23000', '23999', '24', '39', '400', '749', '7500', '9999' ] ],
		970   => [ 'Mexico'                       => [ '01', '59', '600', '899', '9000', '9099', '91000', '96999', '9700', '9999' ] ],
		971   => [ 'Philippines'                  => [ '000', '015', '0160', '0199', '02', '02', '0300', '0599', '06', '49', '500', '849', '8500', '9099', '91000', '95999', '9600', '9699', '97', '98', '9900', '9999' ] ],
		972   => [ 'Portugal'                     => [ '0', '1', '20', '54', '550', '799', '8000', '9499', '95000', '99999' ] ],
		973   => [ 'Romania'                      => [ '0', '0', '100', '169', '1700', '1999', '20', '54', '550', '759', '7600', '8499', '85000', '88999', '8900', '9499', '95000', '99999' ] ],
		974   => [ 'Thailand'                     => [ '00', '19', '200', '699', '7000', '8499', '85000', '89999', '90000', '94999', '9500', '9999' ] ],
		975   => [ 'Turkey'                       => [ '00000', '01999', '02', '23', '2400', '2499', '250', '599', '6000', '9199', '92000', '98999', '990', '999' ] ],
		976   => [ 'Caribbean Community'          => [ '0', '3', '40', '59', '600', '799', '8000', '9499', '95000', '99999' ] ],
		977   => [ 'Egypt'                        => [ '00', '19', '200', '499', '5000', '6999', '700', '849', '85000', '89999', '90', '98', '990', '999' ] ],
		978   => [ 'Nigeria'                      => [ '000', '199', '2000', '2999', '30000', '79999', '8000', '8999', '900', '999' ] ],
		979   => [ 'Indonesia'                    => [ '000', '099', '1000', '1499', '15000', '19999', '20', '29', '3000', '3999', '400', '799', '8000', '9499', '95000', '99999' ] ],
		980   => [ 'Venezuela'                    => [ '00', '19', '200', '599', '6000', '9999' ] ],
		981   => [ 'Singapore'                    => [ '00', '16', '17000', '17999', '18', '19', '200', '299', '3000', '3099', '310', '399', '4000', '9999' ] ],
		982   => [ 'South Pacific'                => [ '00', '09', '100', '699', '70', '89', '9000', '9799', '98000', '99999' ] ],
		983   => [ 'Malaysia'                     => [ '00', '01', '020', '199', '2000', '3999', '40000', '44999', '45', '49', '50', '79', '800', '899', '9000', '9899', '99000', '99999' ] ],
		984   => [ 'Bangladesh'                   => [ '00', '39', '400', '799', '8000', '8999', '90000', '99999' ] ],
		985   => [ 'Belarus'                      => [ '00', '39', '400', '599', '6000', '8799', '880', '899', '90000', '99999' ] ],
		986   => [ 'Taiwan'                       => [ '00', '05', '06000', '06999', '0700', '0799', '08', '11', '120', '539', '5400', '7999', '80000', '99999' ] ],
		987   => [ 'Argentina'                    => [ '00', '09', '1000', '1999', '20000', '29999', '30', '35', '3600', '3999', '4000', '4199', '42', '43', '4400', '4499', '45000', '48999', '4900', '4999', '500', '829', '8300', '8499', '85', '89', '9000', '9499', '95000', '99999' ] ],
		988   => [ 'Hong Kong, China'             => [ '00', '11', '12000', '19999', '200', '739', '74000', '76999', '77000', '79999', '8000', '9699', '97000', '99999' ] ],
		989   => [ 'Portugal'                     => [ '0', '1', '20', '34', '35000', '36999', '37', '52', '53000', '54999', '550', '799', '8000', '9499', '95000', '99999' ] ],
		9914  => [ 'Kenya'                        => [ '40', '44', '700', '749', '9850', '9999' ] ],
		9915  => [ 'Uruguay'                      => [ '40', '59', '650', '799', '9300', '9999' ] ],
		9916  => [ 'Estonia'                      => [ '0', '0', '10', '39', '4', '4', '600', '749', '9500', '9999' ] ],
		9917  => [ 'Bolivia'                      => [ '0', '0', '30', '34', '600', '699', '9800', '9999' ] ],
		9918  => [ 'Malta'                        => [ '0', '0', '20', '29', '600', '799', '9500', '9999' ] ],
		9919  => [ 'Mongolia'                     => [ '20', '27', '500', '599', '9500', '9999' ] ],
		9920  => [ 'Morocco'                      => [ '32', '39', '550', '799', '9000', '9999' ] ],
		9921  => [ 'Kuwait'                       => [ '0', '0', '30', '39', '700', '899', '9700', '9999' ] ],
		9922  => [ 'Iraq'                         => [ '20', '29', '600', '799', '9000', '9999' ] ],
		9923  => [ 'Jordan'                       => [ '0', '0', '10', '49', '700', '899', '9700', '9999' ] ],
		9924  => [ 'Cambodia'                     => [ '30', '39', '500', '649', '9000', '9999' ] ],
		9925  => [ 'Cyprus'                       => [ '0', '2', '30', '54', '550', '734', '7350', '9999' ] ],
		9926  => [ 'Bosnia and Herzegovina'       => [ '0', '1', '20', '39', '400', '799', '8000', '9999' ] ],
		9927  => [ 'Qatar'                        => [ '00', '09', '100', '399', '4000', '4999' ] ],
		9928  => [ 'Albania'                      => [ '00', '09', '100', '399', '4000', '4999' ] ],
		9929  => [ 'Guatemala'                    => [ '0', '3', '40', '54', '550', '799', '8000', '9999' ] ],
		9930  => [ 'Costa Rica'                   => [ '00', '49', '500', '939', '9400', '9999' ] ],
		9931  => [ 'Algeria'                      => [ '00', '29', '300', '899', '9000', '9999' ] ],
		9932  => [ 'Lao People\'s Democratic Republic' => [ '00', '39', '400', '849', '8500', '9999' ] ],
		9933  => [ 'Syria'                        => [ '0', '0', '10', '39', '400', '899', '9000', '9999' ] ],
		9934  => [ 'Latvia'                       => [ '0', '0', '10', '49', '500', '799', '8000', '9999' ] ],
		9935  => [ 'Iceland'                      => [ '0', '0', '10', '39', '400', '899', '9000', '9999' ] ],
		9936  => [ 'Afghanistan'                  => [ '0', '1', '20', '39', '400', '799', '8000', '9999' ] ],
		9937  => [ 'Nepal'                        => [ '0', '2', '30', '49', '500', '799', '8000', '9999' ] ],
		9938  => [ 'Tunisia'                      => [ '00', '79', '800', '949', '9500', '9999' ] ],
		9939  => [ 'Armenia'                      => [ '0', '4', '50', '79', '800', '899', '9000', '9799', '98', '99' ] ],
		9940  => [ 'Montenegro'                   => [ '0', '1', '20', '49', '500', '839', '84', '86', '8700', '9999' ] ],
		9941  => [ 'Georgia'                      => [ '0', '0', '10', '39', '400', '799', '8', '8', '9000', '9999' ] ],
		9942  => [ 'Ecuador'                      => [ '00', '74', '750', '849', '8500', '8999', '900', '984', '9850', '9999' ] ],
		9943  => [ 'Uzbekistan'                   => [ '00', '29', '300', '399', '4000', '9749', '975', '999' ] ],
		9944  => [ 'Turkey'                       => [ '0000', '0999', '100', '499', '5000', '5999', '60', '69', '700', '799', '80', '89', '900', '999' ] ],
		9945  => [ 'Dominican Republic'           => [ '00', '00', '010', '079', '08', '39', '400', '569', '57', '57', '580', '799', '80', '80', '810', '849', '8500', '9999' ] ],
		9946  => [ 'Korea, P.D.R.'                => [ '0', '1', '20', '39', '400', '899', '9000', '9999' ] ],
		9947  => [ 'Algeria'                      => [ '0', '1', '20', '79', '800', '999' ] ],
		9948  => [ 'United Arab Emirates'         => [ '00', '39', '400', '849', '8500', '9999' ] ],
		9949  => [ 'Estonia'                      => [ '00', '08', '090', '099', '10', '39', '400', '699', '70', '71', '7200', '7499', '75', '89', '9000', '9999' ] ],
		9950  => [ 'Palestine'                    => [ '00', '29', '300', '849', '8500', '9999' ] ],
		9951  => [ 'Kosova'                       => [ '00', '39', '400', '849', '8500', '9999' ] ],
		9952  => [ 'Azerbaijan'                   => [ '0', '1', '20', '39', '400', '799', '8000', '9999' ] ],
		9953  => [ 'Lebanon'                      => [ '0', '0', '10', '39', '400', '599', '60', '89', '9000', '9299', '93', '96', '970', '999' ] ],
		9954  => [ 'Morocco'                      => [ '0', '1', '20', '39', '400', '799', '8000', '9899', '99', '99' ] ],
		9955  => [ 'Lithuania'                    => [ '00', '39', '400', '929', '9300', '9999' ] ],
		9956  => [ 'Cameroon'                     => [ '0', '0', '10', '39', '400', '899', '9000', '9999' ] ],
		9957  => [ 'Jordan'                       => [ '00', '39', '400', '649', '65', '67', '680', '699', '70', '84', '8500', '8799', '88', '99' ] ],
		9958  => [ 'Bosnia and Herzegovina'       => [ '00', '01', '020', '029', '0300', '0399', '040', '089', '0900', '0999', '10', '18', '1900', '1999', '20', '49', '500', '899', '9000', '9999' ] ],
		9959  => [ 'Libya'                        => [ '0', '1', '20', '79', '800', '949', '9500', '9699', '970', '979', '98', '99' ] ],
		9960  => [ 'Saudi Arabia'                 => [ '00', '59', '600', '899', '9000', '9999' ] ],
		9961  => [ 'Algeria'                      => [ '0', '2', '30', '69', '700', '949', '9500', '9999' ] ],
		9962  => [ 'Panama'                       => [ '00', '54', '5500', '5599', '56', '59', '600', '849', '8500', '9999' ] ],
		9963  => [ 'Cyprus'                       => [ '0', '1', '2000', '2499', '250', '279', '2800', '2999', '30', '54', '550', '734', '7350', '7499', '7500', '9999' ] ],
		9964  => [ 'Ghana'                        => [ '0', '6', '70', '94', '950', '999' ] ],
		9965  => [ 'Kazakhstan'                   => [ '00', '39', '400', '899', '9000', '9999' ] ],
		9966  => [ 'Kenya'                        => [ '000', '139', '14', '14', '1500', '1999', '20', '69', '7000', '7499', '750', '820', '8210', '8249', '825', '825', '8260', '8289', '829', '959', '9600', '9999' ] ],
		9967  => [ 'Kyrgyz Republic'              => [ '00', '39', '400', '899', '9000', '9999' ] ],
		9968  => [ 'Costa Rica'                   => [ '00', '49', '500', '939', '9400', '9999' ] ],
		9970  => [ 'Uganda'                       => [ '00', '39', '400', '899', '9000', '9999' ] ],
		9971  => [ 'Singapore'                    => [ '0', '5', '60', '89', '900', '989', '9900', '9999' ] ],
		9972  => [ 'Peru'                         => [ '00', '09', '1', '1', '200', '249', '2500', '2999', '30', '59', '600', '899', '9000', '9999' ] ],
		9973  => [ 'Tunisia'                      => [ '00', '05', '060', '089', '0900', '0999', '10', '69', '700', '969', '9700', '9999' ] ],
		9974  => [ 'Uruguay'                      => [ '0', '2', '30', '54', '550', '749', '7500', '8799', '880', '909', '91', '94', '95', '99' ] ],
		9975  => [ 'Moldova'                      => [ '0', '0', '100', '299', '3000', '3999', '4000', '4499', '45', '89', '900', '949', '9500', '9999' ] ],
		9976  => [ 'Tanzania'                     => [ '0', '4', '5000', '5799', '580', '589', '59', '89', '900', '989', '9900', '9999' ] ],
		9977  => [ 'Costa Rica'                   => [ '00', '89', '900', '989', '9900', '9999' ] ],
		9978  => [ 'Ecuador'                      => [ '00', '29', '300', '399', '40', '94', '950', '989', '9900', '9999' ] ],
		9979  => [ 'Iceland'                      => [ '0', '4', '50', '64', '650', '659', '66', '75', '760', '899', '9000', '9999' ] ],
		9980  => [ 'Papua New Guinea'             => [ '0', '3', '40', '89', '900', '989', '9900', '9999' ] ],
		9981  => [ 'Morocco'                      => [ '00', '09', '100', '159', '1600', '1999', '20', '79', '800', '949', '9500', '9999' ] ],
		9982  => [ 'Zambia'                       => [ '00', '79', '800', '989', '9900', '9999' ] ],
		9983  => [ 'Gambia'                       => [ '80', '94', '950', '989', '9900', '9999' ] ],
		9984  => [ 'Latvia'                       => [ '00', '49', '500', '899', '9000', '9999' ] ],
		9985  => [ 'Estonia'                      => [ '0', '4', '50', '79', '800', '899', '9000', '9999' ] ],
		9986  => [ 'Lithuania'                    => [ '00', '39', '400', '899', '9000', '9399', '940', '969', '97', '99' ] ],
		9987  => [ 'Tanzania'                     => [ '00', '39', '400', '879', '8800', '9999' ] ],
		9988  => [ 'Ghana'                        => [ '0', '3', '40', '54', '550', '749', '7500', '9999' ] ],
		9989  => [ 'North Macedonia'              => [ '0', '0', '100', '199', '2000', '2999', '30', '59', '600', '949', '9500', '9999' ] ],
		99901 => [ 'Bahrain'                      => [ '00', '49', '500', '799', '80', '99' ] ],
		99902 => [ 'Reserved Agency'              => [  ] ],
		99903 => [ 'Mauritius'                    => [ '0', '1', '20', '89', '900', '999' ] ],
		99904 => [ 'Curaçao'                      => [ '0', '5', '60', '89', '900', '999' ] ],
		99905 => [ 'Bolivia'                      => [ '0', '3', '40', '79', '800', '999' ] ],
		99906 => [ 'Kuwait'                       => [ '0', '2', '30', '59', '600', '699', '70', '89', '90', '94', '950', '999' ] ],
		99908 => [ 'Malawi'                       => [ '0', '0', '10', '89', '900', '999' ] ],
		99909 => [ 'Malta'                        => [ '0', '3', '40', '94', '950', '999' ] ],
		99910 => [ 'Sierra Leone'                 => [ '0', '2', '30', '89', '900', '999' ] ],
		99911 => [ 'Lesotho'                      => [ '00', '59', '600', '999' ] ],
		99912 => [ 'Botswana'                     => [ '0', '3', '400', '599', '60', '89', '900', '999' ] ],
		99913 => [ 'Andorra'                      => [ '0', '2', '30', '35', '600', '604' ] ],
		99914 => [ 'International NGO Publishers' => [ '0', '4', '50', '69', '7', '7', '80', '89', '900', '999' ] ],
		99915 => [ 'Maldives'                     => [ '0', '4', '50', '79', '800', '999' ] ],
		99916 => [ 'Namibia'                      => [ '0', '2', '30', '69', '700', '999' ] ],
		99917 => [ 'Brunei Darussalam'            => [ '0', '2', '30', '88', '890', '999' ] ],
		99918 => [ 'Faroe Islands'                => [ '0', '3', '40', '79', '800', '999' ] ],
		99919 => [ 'Benin'                        => [ '0', '2', '300', '399', '40', '79', '800', '999' ] ],
		99920 => [ 'Andorra'                      => [ '0', '4', '50', '89', '900', '999' ] ],
		99921 => [ 'Qatar'                        => [ '0', '1', '20', '69', '700', '799', '8', '8', '90', '99' ] ],
		99922 => [ 'Guatemala'                    => [ '0', '3', '40', '69', '700', '999' ] ],
		99923 => [ 'El Salvador'                  => [ '0', '1', '20', '79', '800', '999' ] ],
		99924 => [ 'Nicaragua'                    => [ '0', '1', '20', '79', '800', '999' ] ],
		99925 => [ 'Paraguay'                     => [ '0', '0', '10', '19', '200', '299', '3', '3', '40', '79', '800', '999' ] ],
		99926 => [ 'Honduras'                     => [ '0', '0', '10', '59', '600', '869', '87', '89', '90', '99' ] ],
		99927 => [ 'Albania'                      => [ '0', '2', '30', '59', '600', '999' ] ],
		99928 => [ 'Georgia'                      => [ '0', '0', '10', '79', '800', '999' ] ],
		99929 => [ 'Mongolia'                     => [ '0', '4', '50', '79', '800', '999' ] ],
		99930 => [ 'Armenia'                      => [ '0', '4', '50', '79', '800', '999' ] ],
		99931 => [ 'Seychelles'                   => [ '0', '4', '50', '79', '800', '999' ] ],
		99932 => [ 'Malta'                        => [ '0', '0', '10', '59', '600', '699', '7', '7', '80', '99' ] ],
		99933 => [ 'Nepal'                        => [ '0', '2', '30', '59', '600', '999' ] ],
		99934 => [ 'Dominican Republic'           => [ '0', '1', '20', '79', '800', '999' ] ],
		99935 => [ 'Haiti'                        => [ '0', '2', '30', '59', '600', '699', '7', '8', '90', '99' ] ],
		99936 => [ 'Bhutan'                       => [ '0', '0', '10', '59', '600', '999' ] ],
		99937 => [ 'Macau'                        => [ '0', '1', '20', '59', '600', '999' ] ],
		99938 => [ 'Srpska, Republic of'          => [ '0', '1', '20', '59', '600', '899', '90', '99' ] ],
		99939 => [ 'Guatemala'                    => [ '0', '5', '60', '89', '900', '999' ] ],
		99940 => [ 'Georgia'                      => [ '0', '0', '10', '69', '700', '999' ] ],
		99941 => [ 'Armenia'                      => [ '0', '2', '30', '79', '800', '999' ] ],
		99942 => [ 'Sudan'                        => [ '0', '4', '50', '79', '800', '999' ] ],
		99943 => [ 'Albania'                      => [ '0', '2', '30', '59', '600', '999' ] ],
		99944 => [ 'Ethiopia'                     => [ '0', '4', '50', '79', '800', '999' ] ],
		99945 => [ 'Namibia'                      => [ '0', '4', '50', '89', '900', '999' ] ],
		99946 => [ 'Nepal'                        => [ '0', '2', '30', '59', '600', '999' ] ],
		99947 => [ 'Tajikistan'                   => [ '0', '2', '30', '69', '700', '999' ] ],
		99948 => [ 'Eritrea'                      => [ '0', '4', '50', '79', '800', '999' ] ],
		99949 => [ 'Mauritius'                    => [ '0', '1', '20', '89', '900', '999' ] ],
		99950 => [ 'Cambodia'                     => [ '0', '4', '50', '79', '800', '999' ] ],
		99951 => [ 'Reserved Agency'              => [  ] ],
		99952 => [ 'Mali'                         => [ '0', '4', '50', '79', '800', '999' ] ],
		99953 => [ 'Paraguay'                     => [ '0', '2', '30', '79', '800', '939', '94', '99' ] ],
		99954 => [ 'Bolivia'                      => [ '0', '2', '30', '69', '700', '879', '88', '99' ] ],
		99955 => [ 'Srpska, Republic of'          => [ '0', '1', '20', '59', '600', '799', '80', '99' ] ],
		99956 => [ 'Albania'                      => [ '00', '59', '600', '859', '86', '99' ] ],
		99957 => [ 'Malta'                        => [ '0', '1', '20', '79', '800', '949', '95', '99' ] ],
		99958 => [ 'Bahrain'                      => [ '0', '4', '50', '93', '940', '949', '950', '999' ] ],
		99959 => [ 'Luxembourg'                   => [ '0', '2', '30', '59', '600', '999' ] ],
		99960 => [ 'Malawi'                       => [ '070', '099', '10', '94', '950', '999' ] ],
		99961 => [ 'El Salvador'                  => [ '0', '2', '300', '369', '37', '89', '900', '999' ] ],
		99962 => [ 'Mongolia'                     => [ '0', '4', '50', '79', '800', '999' ] ],
		99963 => [ 'Cambodia'                     => [ '00', '49', '500', '919', '92', '99' ] ],
		99964 => [ 'Nicaragua'                    => [ '0', '1', '20', '79', '800', '999' ] ],
		99965 => [ 'Macau'                        => [ '0', '2', '300', '359', '36', '62', '630', '999' ] ],
		99966 => [ 'Kuwait'                       => [ '0', '2', '30', '69', '700', '799', '80', '96', '970', '999' ] ],
		99967 => [ 'Paraguay'                     => [ '0', '0', '10', '59', '600', '999' ] ],
		99968 => [ 'Botswana'                     => [ '0', '3', '400', '599', '60', '89', '900', '999' ] ],
		99969 => [ 'Oman'                         => [ '0', '4', '50', '79', '800', '999' ] ],
		99970 => [ 'Haiti'                        => [ '0', '4', '50', '89', '900', '999' ] ],
		99971 => [ 'Myanmar'                      => [ '0', '3', '40', '84', '850', '999' ] ],
		99972 => [ 'Faroe Islands'                => [ '0', '4', '50', '89', '900', '999' ] ],
		99973 => [ 'Mongolia'                     => [ '0', '3', '40', '79', '800', '999' ] ],
		99974 => [ 'Bolivia'                      => [ '0', '0', '10', '25', '260', '399', '40', '63', '640', '649', '65', '79', '800', '999' ] ],
		99975 => [ 'Tajikistan'                   => [ '0', '2', '300', '399', '40', '79', '800', '999' ] ],
		99976 => [ 'Srpska, Republic of'          => [ '0', '1', '20', '59', '600', '799', '900', '999' ] ],
		99977 => [ 'Rwanda'                       => [ '0', '1', '40', '69', '700', '799', '995', '999' ] ],
		99978 => [ 'Mongolia'                     => [ '0', '4', '50', '69', '700', '999' ] ],
		99979 => [ 'Honduras'                     => [ '0', '4', '50', '79', '800', '999' ] ],
		99980 => [ 'Bhutan'                       => [ '0', '0', '30', '59', '800', '999' ] ],
		99981 => [ 'Macau'                        => [ '0', '1', '30', '59', '800', '999' ] ],
		99982 => [ 'Benin'                        => [ '0', '0', '50', '65', '900', '979' ] ],
		99983 => [ 'El Salvador'                  => [ '0', '0', '50', '69', '950', '999' ] ],
		99985 => [ 'Tajikistan'                   => [ '55', '59', '950', '999' ] ],
		99986 => [ 'Myanmar'                      => [ '0', '0', '50', '69', '950', '999' ] ],
		99987 => [ 'Luxembourg'                   => [ '850', '999' ] ],
	},
	979 => {
		8     => [ 'United States'                => [ '200', '219', '5500', '7499', '9850000', '9850009' ] ],
		10    => [ 'France'                       => [ '00', '19', '200', '699', '7000', '8999', '90000', '97599', '976000', '999999' ] ],
		11    => [ 'Korea, Republic'              => [ '00', '24', '250', '549', '5500', '8499', '85000', '94999', '950000', '999999' ] ],
		12    => [ 'Italy'                        => [ '200', '299', '5950', '5999', '80000', '84999' ] ],
	},
	);
	}

sub _get_data {
# eventually fetch this from the internet
# http://www.isbn-international.org/agency?rmxml=1

	if( defined $ENV{ISBN_RANGE_MESSAGE} and ! -e $ENV{ISBN_RANGE_MESSAGE} ) {
		carp "ISBN_RANGE_MESSAGE is set to [$ENV{ISBN_RANGE_MESSAGE}] but that file does not exist!\nTrying to use the default locations\n";
		}

	my $file = 'RangeMessage.xml';
	no warnings 'uninitialized';
	my @candidates = grep { -e } (
		$ENV{ISBN_RANGE_MESSAGE},              # env
		catfile( dirname( __FILE__ ), $file ), # next to the module
		$file,                                 # current directory
		);

	my $hash;

	$hash = _parse_range_message( $candidates[0] ) if @candidates;

	if( defined $hash ) { return %$hash   }
	else                { _default_data() }
	}

sub _parse_range_message {
	my( $file ) = @_;

	open my $fh, '<:utf8', $file or do {
		carp "Could not open $file to get ISBN range data [$!]\n";
		return
		};

	my $data = do { local $/; <$fh> };

	my $ds;

	my( $serial_number ) = $data =~ m|<MessageSerialNumber>(.*?)</MessageSerialNumber>|;
	my( $date )          = $data =~ m|<MessageDate>(.*?)</MessageDate>|;

	$ds->{'_source'} = $file;
	$ds->{'_serial'} = $serial_number;
	$ds->{'_date'}   = $date;

	my( $registration_groups ) = $data =~ m|<RegistrationGroups>(.*?)</RegistrationGroups>|s;

	my @groups = $registration_groups =~ m|<Group>(.*?)</Group>|sg;

	foreach my $group ( @groups ) {
		my( $isbn_prefix, $prefix ) = $group =~ m|<Prefix>(97[89]-)?([0-9]+?)</Prefix>|;
		$isbn_prefix = $isbn_prefix eq '979-' ? "979" : "978";
		my( $agency ) = $group =~ m|<Agency>(.*?)</Agency>|;
		$agency =~ s/^\s+|\s+$//g;  # 'Croatia     ' ???
		my @rules =
			map {
				my( $range ) = m|<Range>(.*?)</Range>|;
				my( $length ) = m|<Length>(.*?)</Length>|;
				my( $low, $high ) = split /-/, $range, 2;
				( substr($low, 0, $length), substr($high, 0, $length) );
				}
			grep {
				! m|<Length>0</Length>|
				}
				$group =~ m|<Rule>(.*?)</Rule>|sg;

		$ds->{$isbn_prefix}->{$prefix} = [ $agency => \@rules ];
		}

	$ds;
	}

%Business::ISBN::country_data = _get_data();

# I cheat a little bit here. I know that that the max length is
# 5, and that I know that those will start with 999xx. :)
# however, if the data changes I should think about this again.
$Business::ISBN::MAX_COUNTRY_CODE_LENGTH = length(
	( sort { $a <=> $b } grep { ! /\A_/ } map { keys %$_ } @Business::ISBN::country_data{qw(978 979)} )[-1]
	);

package # Hide from PAUSE
	Business::ISBN;

sub isbn_group_code_string_from_number {
	return if $_[0] =~ /\A_/;
	return $Business::ISBN::country_data{ $_[0] }[0] || '';
	}

sub isbn_publisher_ranges_from_group_number {
	return if $_[0] =~ /\A_/;
	return $Business::ISBN::country_data{ $_[0] }[1] || [];
	}

sub isbn_data_source {
	return $Business::ISBN::country_data{ '_source' } || __FILE__
	}

1;
