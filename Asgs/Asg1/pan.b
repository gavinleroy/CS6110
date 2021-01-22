	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC bubsort */

	case 3: // STATE 10
		;
		((P0 *)_this)->j = trpt->bup.ovals[1];
		((P0 *)_this)->t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 4: // STATE 2
		;
		((P0 *)_this)->a[1] = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 3
		;
		((P0 *)_this)->a[2] = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 4
		;
		((P0 *)_this)->a[3] = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 5
		;
		((P0 *)_this)->a[4] = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 10
		;
		((P0 *)_this)->j = trpt->bup.ovals[1];
		((P0 *)_this)->t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 9: // STATE 11
		;
	/* 0 */	((P0 *)_this)->j = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 11: // STATE 21
		;
		((P0 *)_this)->j = trpt->bup.ovals[3];
		((P0 *)_this)->a[ Index(((P0 *)_this)->j, 5) ] = trpt->bup.ovals[2];
		((P0 *)_this)->a[ Index((((P0 *)_this)->j-1), 5) ] = trpt->bup.ovals[1];
		((P0 *)_this)->t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 12: // STATE 21
		;
		((P0 *)_this)->j = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 21
		;
		((P0 *)_this)->j = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 27
		;
		((P0 *)_this)->j = trpt->bup.ovals[2];
		((P0 *)_this)->t = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->t = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 15: // STATE 28
		;
	/* 0 */	((P0 *)_this)->j = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 17: // STATE 38
		;
		((P0 *)_this)->j = trpt->bup.ovals[3];
		((P0 *)_this)->a[ Index(((P0 *)_this)->j, 5) ] = trpt->bup.ovals[2];
		((P0 *)_this)->a[ Index((((P0 *)_this)->j-1), 5) ] = trpt->bup.ovals[1];
		((P0 *)_this)->t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 18: // STATE 38
		;
		((P0 *)_this)->j = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 38
		;
		((P0 *)_this)->j = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 47
		;
		((P0 *)_this)->t = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->t = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 21: // STATE 47
		;
		((P0 *)_this)->t = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 49
		;
		((P0 *)_this)->t = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 51
		;
		((P0 *)_this)->t = trpt->bup.oval;
		;
		goto R999;
;
		
	case 24: // STATE 52
		goto R999;

	case 25: // STATE 57
		;
		p_restor(II);
		;
		;
		goto R999;
	}

