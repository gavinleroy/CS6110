#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC bubsort */
	case 3: // STATE 1 - bubble_sort_wrong.pml:10 - [goto :b0] (0:22:2 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		;
		/* merge: t = a[1](22, 9, 22) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = ((int)((P0 *)_this)->a[1]);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: j = (1+1)(22, 10, 22) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (1+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 4: // STATE 2 - bubble_sort_wrong.pml:10 - [a[1] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->a[1]);
		((P0 *)_this)->a[1] = 1;
#ifdef VAR_RANGES
		logval("bubsort:a[1]", ((int)((P0 *)_this)->a[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - bubble_sort_wrong.pml:10 - [a[2] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->a[2]);
		((P0 *)_this)->a[2] = 1;
#ifdef VAR_RANGES
		logval("bubsort:a[2]", ((int)((P0 *)_this)->a[2]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - bubble_sort_wrong.pml:10 - [a[3] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->a[3]);
		((P0 *)_this)->a[3] = 1;
#ifdef VAR_RANGES
		logval("bubsort:a[3]", ((int)((P0 *)_this)->a[3]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - bubble_sort_wrong.pml:10 - [a[4] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->a[4]);
		((P0 *)_this)->a[4] = 1;
#ifdef VAR_RANGES
		logval("bubsort:a[4]", ((int)((P0 *)_this)->a[4]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 9 - bubble_sort_wrong.pml:13 - [t = a[1]] (0:22:2 - 2)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = ((int)((P0 *)_this)->a[1]);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: j = (1+1)(22, 10, 22) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (1+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 11 - bubble_sort_wrong.pml:17 - [((j>(5-1)))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((int)((P0 *)_this)->j)>(5-1))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: j */  (trpt+1)->bup.oval = ((P0 *)_this)->j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->j = 0;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 13 - bubble_sort_wrong.pml:18 - [((j<=(5-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)((P0 *)_this)->j)<=(5-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 14 - bubble_sort_wrong.pml:20 - [((a[(j-1)]>a[j]))] (22:0:4 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!((((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ])>((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]))))
			continue;
		/* merge: t = a[(j-1)](22, 15, 22) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = ((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ]);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: a[(j-1)] = a[j](22, 16, 22) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ]);
		((P0 *)_this)->a[ Index((((P0 *)_this)->j-1), 5) ] = ((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]);
#ifdef VAR_RANGES
		logval("bubsort:a[(bubsort:j-1)]", ((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ]));
#endif
		;
		/* merge: a[j] = t(22, 17, 22) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]);
		((P0 *)_this)->a[ Index(((P0 *)_this)->j, 5) ] = ((int)((P0 *)_this)->t);
#ifdef VAR_RANGES
		logval("bubsort:a[bubsort:j]", ((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]));
#endif
		;
		/* merge: .(goto)(22, 20, 22) */
		reached[0][20] = 1;
		;
		/* merge: j = (j+1)(22, 21, 22) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (((int)((P0 *)_this)->j)+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 12: // STATE 18 - bubble_sort_wrong.pml:21 - [((a[(j-1)]<=a[j]))] (22:0:1 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!((((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ])<=((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]))))
			continue;
		/* merge: .(goto)(22, 20, 22) */
		reached[0][20] = 1;
		;
		/* merge: j = (j+1)(22, 21, 22) */
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (((int)((P0 *)_this)->j)+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: // STATE 21 - bubble_sort_wrong.pml:23 - [j = (j+1)] (0:22:1 - 3)
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (((int)((P0 *)_this)->j)+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 14: // STATE 25 - bubble_sort_wrong.pml:27 - [((t!=a[1]))] (39:0:3 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((int)((P0 *)_this)->t)!=((int)((P0 *)_this)->a[1]))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: t */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->t;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->t = 0;
		/* merge: t = a[1](39, 26, 39) */
		reached[0][26] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = ((int)((P0 *)_this)->a[1]);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: j = (1+1)(39, 27, 39) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (1+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 40, 39) */
		reached[0][40] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 15: // STATE 28 - bubble_sort_wrong.pml:29 - [((j>(5-1)))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		if (!((((int)((P0 *)_this)->j)>(5-1))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: j */  (trpt+1)->bup.oval = ((P0 *)_this)->j;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->j = 0;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 30 - bubble_sort_wrong.pml:30 - [((j<=(5-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!((((int)((P0 *)_this)->j)<=(5-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 31 - bubble_sort_wrong.pml:32 - [((a[(j-1)]>a[j]))] (39:0:4 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		if (!((((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ])>((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]))))
			continue;
		/* merge: t = a[(j-1)](39, 32, 39) */
		reached[0][32] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = ((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ]);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: a[(j-1)] = a[j](39, 33, 39) */
		reached[0][33] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ]);
		((P0 *)_this)->a[ Index((((P0 *)_this)->j-1), 5) ] = ((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]);
#ifdef VAR_RANGES
		logval("bubsort:a[(bubsort:j-1)]", ((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ]));
#endif
		;
		/* merge: a[j] = t(39, 34, 39) */
		reached[0][34] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]);
		((P0 *)_this)->a[ Index(((P0 *)_this)->j, 5) ] = ((int)((P0 *)_this)->t);
#ifdef VAR_RANGES
		logval("bubsort:a[bubsort:j]", ((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]));
#endif
		;
		/* merge: .(goto)(39, 37, 39) */
		reached[0][37] = 1;
		;
		/* merge: j = (j+1)(39, 38, 39) */
		reached[0][38] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (((int)((P0 *)_this)->j)+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 40, 39) */
		reached[0][40] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 18: // STATE 35 - bubble_sort_wrong.pml:33 - [((a[(j-1)]<=a[j]))] (39:0:1 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		if (!((((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->j)-1), 5) ])<=((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->j), 5) ]))))
			continue;
		/* merge: .(goto)(39, 37, 39) */
		reached[0][37] = 1;
		;
		/* merge: j = (j+1)(39, 38, 39) */
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (((int)((P0 *)_this)->j)+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 40, 39) */
		reached[0][40] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 19: // STATE 38 - bubble_sort_wrong.pml:35 - [j = (j+1)] (0:39:1 - 3)
		IfNotBlocked
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (((int)((P0 *)_this)->j)+1);
#ifdef VAR_RANGES
		logval("bubsort:j", ((int)((P0 *)_this)->j));
#endif
		;
		/* merge: .(goto)(0, 40, 39) */
		reached[0][40] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 20: // STATE 42 - bubble_sort_wrong.pml:37 - [((t==a[1]))] (54:0:2 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		if (!((((int)((P0 *)_this)->t)==((int)((P0 *)_this)->a[1]))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: t */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->t;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->t = 0;
		/* merge: goto :b2(54, 43, 54) */
		reached[0][43] = 1;
		;
		/* merge: t = 1(54, 47, 54) */
		reached[0][47] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = 1;
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[0][55] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 21: // STATE 47 - bubble_sort_wrong.pml:41 - [t = 1] (0:54:1 - 3)
		IfNotBlocked
		reached[0][47] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = 1;
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[0][55] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 22: // STATE 48 - bubble_sort_wrong.pml:53 - [((t<((5-1)-1)))] (54:0:1 - 1)
		IfNotBlocked
		reached[0][48] = 1;
		if (!((((int)((P0 *)_this)->t)<((5-1)-1))))
			continue;
		/* merge: t = (t+1)(0, 49, 54) */
		reached[0][49] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = (((int)((P0 *)_this)->t)+1);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[0][55] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 50 - bubble_sort_wrong.pml:54 - [((t>1))] (54:0:1 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		if (!((((int)((P0 *)_this)->t)>1)))
			continue;
		/* merge: t = (t-1)(0, 51, 54) */
		reached[0][51] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->t);
		((P0 *)_this)->t = (((int)((P0 *)_this)->t)-1);
#ifdef VAR_RANGES
		logval("bubsort:t", ((int)((P0 *)_this)->t));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[0][55] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 24: // STATE 52 - bubble_sort_wrong.pml:55 - [((a[t]>a[(t+1)]))] (54:0:0 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		if (!((((int)((P0 *)_this)->a[ Index(((int)((P0 *)_this)->t), 5) ])>((int)((P0 *)_this)->a[ Index((((int)((P0 *)_this)->t)+1), 5) ]))))
			continue;
		/* merge: assert(0)(0, 53, 54) */
		reached[0][53] = 1;
		spin_assert(0, "0", II, tt, t);
		/* merge: .(goto)(0, 55, 54) */
		reached[0][55] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: // STATE 57 - bubble_sort_wrong.pml:57 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

