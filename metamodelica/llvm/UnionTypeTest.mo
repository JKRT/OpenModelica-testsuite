package UnionTypeTest

uniontype encapsulatedData
  record INTEGER
	Integer i;
  end INTEGER;

  record REAL
	Real r;
  end REAL;

  record BOOLEAN
	Boolean b;
  end BOOLEAN;

  record STRING
	String s;
  end STRING;

  record LIST
	list<encapsulatedData> lst;
  end  LIST;

  record SLIST
	list<Integer> lst;
  end SLIST;
end encapsulatedData;

function getInteger
  output Integer i;
  protected encapsulatedData ed;
algorithm
  ed := INTEGER(1337);
  i := match ed
   	case INTEGER(__) then ed.i;
  end match;
end getInteger;

function getReal
  output Real r;
  protected encapsulatedData ed;
algorithm
  ed := REAL(1.0);
  r := match ed
	case BOOLEAN(__) then 4.0;
	case REAL(__) then ed.r;
  end match;
end getReal;

function getBoolean
  output Boolean b;
  protected encapsulatedData ed;
algorithm
  ed := BOOLEAN(true);
  b := match ed
	case BOOLEAN(__) then ed.b;
  end match;
end getBoolean;

function getString
  output String r;
protected
  encapsulatedData ed;
algorithm
  ed := STRING("Hello world!\n");
  r := match ed
	case STRING(__) then ed.s;
  end match;
end getString;

function getSLst
  output list<Integer> lst;
protected
  encapsulatedData ed;
algorithm
  ed := SLIST({1,2,3});
  lst :=
	match ed
	  case SLIST(__) then ed.lst;
	end match;
end getSLst;

function getLst
  output list<encapsulatedData> lst;
protected
  encapsulatedData ed;
algorithm
  ed := LIST({REAL(1.0),REAL(2.0),REAL(3.0)});
  lst := match ed
	case LIST(__) then ed.lst;
  end match;
end getLst;

function getNestedLst
  output list<encapsulatedData> lst;
protected
  encapsulatedData ed;
algorithm
  ed := LIST({LIST({INTEGER(1)}),
			  LIST({INTEGER(1),BOOLEAN(true)}),
			  LIST({INTEGER(1),BOOLEAN(true)}),
			  BOOLEAN(true)});
  lst :=
	match ed
	  case LIST(__) then ed.lst;
	end match;
end getNestedLst;

function getUnionType
  input encapsulatedData d;
  output encapsulatedData dout;
algorithm
  dout := d;
end getUnionType;

end UnionTypeTest;