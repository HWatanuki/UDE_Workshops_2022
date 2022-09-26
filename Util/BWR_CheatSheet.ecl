// *****
// Basic ECL
// A definition
Mydef := 'Hello World';  // "value" definition

// An action
OUTPUT('Hello World');
OUTPUT(mydef);

// *****
// Basic data structures in ECL
// RECORD Structure

// rec := RECORD
  // STRING10  Firstname;
	// STRING    Lastname;
	// STRING1   Gender;
	// UNSIGNED1 Age;
	// INTEGER   Balance;
	// DECIMAL7_2 Income;
// END;

// DATASET Declaration
// ds := DATASET([{'Alysson','Oliveira','M',26,100,1000.50},
               // {'Bruno','Camargo','',22,-100,500.00},
							 // {'Elaine','Silva','F',19,-50,750.60},
							 // {'Julia','Caetano','F',45,500,5000},
							 // {'Odair','Ferreira','M',66,350,6000},
							 // {'Orlando','Silva','U',67,300,4000}],rec);
// OUTPUT(ds);

// *****
// Filtering and aggregating datasets
// recset := ds(Age<65);
// recset; //Equivalent to: OUTPUT(recset);

// recset := ds(Age<65,Gender='M');
// recset;

// IsSeniorMale := ds.Age<65 AND ds.Gender='M'; // "boolean" definition
// recset := ds(IsSeniorMale);
// recset;

// SetGender := ['M','F'];  // "set" definition
// recset := ds(Gender IN SetGender);   
// recset;						// "recordset" definition
// COUNT(recset);    //Equivalent to: OUTPUT(COUNT(recset));

// rec2 := RECORD
  // ds.Gender;
	// cnt := COUNT(GROUP);
// END;

// crosstab := TABLE(ds,rec2,Gender);
// crosstab;

// avg := AVE(crosstab,cnt);
// avg;

// *****
// Basic transformations
// REmoving uneeded fields
// tbl := TABLE(ds,{Firstname,LastName,Income});
// tbl;

// Ordering values
// sortbl := SORT(tbl,LastName);
// sortbl;

// Removing duplicate records
// dedptbl := DEDUP(sortbl,LastName);
// dedptbl;

// Adding a new field
/*rec2 := RECORD
  UNSIGNED   recid;  
	STRING10   Firstname;
	STRING     Lastname;
	STRING1    Gender;
	UNSIGNED1  Age;
	INTEGER    Balance;
	DECIMAL7_2 Income;
END;

IMPORT STD;
rec2 MyTransf(rec Le, UNSIGNED cnt) := TRANSFORM
  SELF.recid:=cnt;
	SELF.Firstname := STD.Str.ToUpperCase(Le.Firstname);
	SELF.Lastname := STD.Str.ToUpperCase(Le.LastName);
  SELF := Le;
END;

newds := PROJECT(ds,MyTransf(LEFT,COUNTER));

newds;

rec3 := RECORD
  STRING10  Firstname;
	STRING    Lastname;
	STRING    Email;
END;
*/
//  DATASET Declaration
/*
ds2 := DATASET([{'ALYSSON','OLIVEIRA','alysson.oliveira@gmail.com'},
               {'BRUNO','CAMARGO','bruno.camargo@gmail.com'},
							 {'ELAINE','SILVA','elaine.silva@gmail.com'},
							 {'JULIA','CAETANO','julia.caetano@gmail.com'},
							 {'ODAIR','FERREIRA','odair.ferreira@gmail.com'},
							 {'ORLANDO','SILVA','orlando.silva@gmail.com'}],rec3);
OUTPUT(ds2);
*/
// Fazendo JOIN de datasets
/*rec4 := RECORD
  rec2;
  rec3.Email;
END;

rec4 MyTransf2(rec2 Le, rec3 Ri) := TRANSFORM
  SELF := Le;
  SELF := Ri;
END;

joineds := JOIN(newds,ds2,LEFT.Firstname=RIGHT.Firstname AND LEFT.Lastname=RIGHT.Lastname,MyTransf2(LEFT,RIGHT));
joineds;
*/

/*
rec := RECORD
  STRING firstname;
	STRING lastname;
	UNSIGNED age;
END;

ds := DATASET([{'Wendy','Frost',34},
               {'Albert','John',34},
							 {'Natan','Bun',45},
							 {'Carl','Moore',56},
							 {'Jimmy','John',66}]
							 ,rec);
OUTPUT(ds); // this OUTPUT exemplifies a dataflow parallelism to be shown via the graphs

mysort1 := SORT(ds,firstname);  //this sort will be ignored by the compiler unless you explicitely asks for its OUTPUT as this sort does not affect the end result
																//(exemplifies a dataflow optimization to be shown via the graphs)
// OUTPUT(mysort1); 

mysort2 := SORT(mysort1,lastname); //this sort will actually only be done after the filter is applied since the compiler understands that only a subset of data needs to be sorted by then 
                                   //(exemplifies another dataflow optimization to be shown via the graphs)

myfilter := mysort2(age>50); 
OUTPUT(myfilter);
*/
