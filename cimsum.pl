#
$loopc = 12;
$loopr = 24;
$loope = 36;
$valca = 1;
$valcb = 1;
$valra = 1;
$valrb = 1;
$vale = 1;
$rowcount=72;
# least common multiple rowcount will always fit:
$multiplesC = $rowcount / $loopc;
$multiplesR = $rowcount / $loopr;
$multiplesE = $rowcount / $loope;
$itre = 0; # lock E to position 0
for ($itrca=0; $itrca < $loopc; ++$itrca)
{
	for ($itrcb=0; $itrcb < $loopc; ++$itrcb)
	{
		for ($itrra=0; $itrra < $loopr; ++$itrra)
		{
			for ($itrrb=0; $itrrb < $loopr; ++$itrrb)
			{
				#clear accumulators
				for ($itr = 0; $itr < $rowcount; ++$itr)
				{
					$holdca[$itr]=0;
					$holdcb[$itr]=0;
					$holdra[$itr]=0;
					$holdrb[$itr]=0;
					$holde[$itr]=0;
				}
				for ($itr = 0; $itr < $rowcount; ++$itr)
				{
					#print ":->".$holdca[$itr]." ".$holdcb[$itr]." ".$holdra[$itr]." ".$holdrb[$itr]." ".$holde[$itr]."\n";
				}
				#print "\n\n";
				#fill ca, cb
				for ($repeatitr = 0; $repeatitr < $multiplesC; ++$repeatitr)
				{
					$holdca[ ($loopc * $repeatitr + $itrca) % 72] = $valca;
					$holdca[ ($loopc * $repeatitr + $itrca + 1) % 72] = $valca;
					#print "indexca:".(($loopc * $repeatitr + $itrca) % 72);
					$holdcb[ ($loopc * $repeatitr + $itrcb) % 72] = $valcb;
					$holdcb[ ($loopc * $repeatitr + $itrcb + 1) % 72] = $valcb;
					#print "indexcb:".(($loopc * $repeatitr + $itrcb) % 72);
				}
				#fill ra, rb
				for ($repeatitr = 0; $repeatitr < $multiplesR; ++$repeatitr)
				{
					$holdra[ ($loopr * $repeatitr + $itrra) % 72] = $valra;
					$holdra[ ($loopr * $repeatitr + $itrra + 1) % 72] = $valra;
					$holdra[ ($loopr * $repeatitr + $itrra + 2) % 72] = $valra;
					$holdra[ ($loopr * $repeatitr + $itrra + 3) % 72] = $valra;
					#print "indexra:".(($loopr * $repeatitr + $itrra) % 72);
					$holdrb[ ($loopr * $repeatitr + $itrrb) % 72] = $valrb;
					$holdrb[ ($loopr * $repeatitr + $itrrb + 1) % 72] = $valrb;
					$holdrb[ ($loopr * $repeatitr + $itrrb + 2) % 72] = $valrb;
					$holdrb[ ($loopr * $repeatitr + $itrrb + 3) % 72] = $valrb;
					#print "indexrb:".(($loopr * $repeatitr + $itrrb) % 72);
				}
				#fill e
				for ($repeatitr = 0; $repeatitr < $multiplesE; ++$repeatitr)
				{
					$holde[ ($loope * $repeatitr + $itre) % 72] = $vale;
					$holde[ ($loope * $repeatitr + $itre + 1) % 72] = $vale;
					$holde[ ($loope * $repeatitr + $itre + 2) % 72] = $vale;
					$holde[ ($loope * $repeatitr + $itre + 3) % 72] = $vale;
					$holde[ ($loope * $repeatitr + $itre + 4) % 72] = $vale;
					$holde[ ($loope * $repeatitr + $itre + 5) % 72] = $vale;
					#print "indexe:".(($loope * $repeatitr + $itre) % 72);
				}
				for ($itr = 0; $itr < $rowcount; ++$itr)
				{
					#print ":->".$holdca[$itr]." ".$holdcb[$itr]." ".$holdra[$itr]." ".$holdrb[$itr]." ".$holde[$itr]."\n";
				}
				#print "\n\n";
				for ($sumitr = 0; $sumitr < $rowcount; ++$sumitr)
				{
					$sumrow[$sumitr] = 0;
					$sumrow[$sumitr] += $holdca[$sumitr];
					$sumrow[$sumitr] += $holdcb[$sumitr];
					$sumrow[$sumitr] += $holdra[$sumitr];
					$sumrow[$sumitr] += $holdrb[$sumitr];
					$sumrow[$sumitr] += $holde[$sumitr];
					$coveredrow[$sumitr]= 0; if ($sumrow[$sumitr] > 0) { $coveredrow[$sumitr] = 1; }
				}
				$coveragetotal = 0;
				for ($countcoverageitr = 0; $countcoverageitr < $rowcount; ++$countcoverageitr )
				{
					$coveragetotal += $coveredrow[$countcoverageitr];
				}
				print $coveragetotal." ".$itrca." ".$itrcb." ".$itrra." ".$itrrb." ".$itre."\n";
				for ($showitr=0; $showitr< $rowcount; ++$showitr)
				{
					#print "->".$coveredrow[$showitr]."\n";
				}
				#print "\n";
			}
		}
	}
}