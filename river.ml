
type bank = BankA | BankB;;

type transferEl = Wolf | Goat | Cabbage | None;;

type status = { 
	wolf : bank;
	goat : bank;
	cabbage : bank;
	shepherd : bank;
	path : transferEl list;
};;

let isSafeStatus (s:status) = 
	not (s.wolf == s.goat && s.wolf != s.shepherd) 
	&& not (s.goat == s.cabbage && s.goat != s.shepherd);;

let isFinalStatus (s:status) = 
	s.wolf == BankB && 
	s.goat == BankB && 
	s.cabbage == BankB && 
	s.shepherd == BankB;;


let init_status = { wolf = BankA; goat = BankA; cabbage = BankA; shepherd = BankA; path = []};;


isSafeStatus init_status;;

let transfer (e:bank) = 
	match e with
		  BankA -> BankB
		| BankB -> BankA;;

let transferWolf (s:status) =
	{ 
		wolf = transfer s.wolf; 
		goat = s.goat; 
		cabbage = s.cabbage; 
		shepherd = transfer s.shepherd; 
		path = s.path @ [Wolf];
	};;

let transferGoat (s:status) =
	{ 
		wolf = s.wolf; 
		goat = transfer s.goat; 
		cabbage = s.cabbage; 
		shepherd = transfer s.shepherd; 
		path = s.path @ [Goat];
	};;

let transferCabbage (s:status) =
	{ 
		wolf = s.wolf; 
		goat = s.goat; 
		cabbage = transfer s.cabbage; 
		shepherd = transfer s.shepherd; 
		path = s.path @ [Cabbage];
	};;

let transferNone (s:status) =
	{ 
		wolf = s.wolf; 
		goat = s.goat; 
		cabbage = s.cabbage; 
		shepherd = transfer s.shepherd; 
		path = s.path @ [None];
	};;

let verifyPath s slist =
	 if isSafeStatus s 
		then slist @ [s]
		else slist;;



let verifyPaths s slist =
	verifyPath (transferWolf s) slist;;


let verifyPaths s slist =
	let new_listw = verifyPath (transferWolf s) slist in
	let new_listg = verifyPath (transferGoat s) new_listw in
	let new_listC = verifyPath (transferCabbage s) new_listg in
	let new_listN = verifyPath (transferNone s) new_listC in
	new_listN;;

let rec iterateStack stack = 
	match stack with
		  s :: slist when isFinalStatus s -> s.path 
		| s :: slist -> iterateStack (verifyPaths s slist)
		| _ -> [];;


iterateStack [init_status];;















