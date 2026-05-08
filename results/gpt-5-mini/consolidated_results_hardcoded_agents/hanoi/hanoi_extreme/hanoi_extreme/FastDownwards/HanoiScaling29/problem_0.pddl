(define (problem hanoi-7-disks)
  (:domain hanoi-multiagent)

  ;; Objects: 7 disks A..G and three pegs Left, Middle, Right.
  (:objects
    A B C D E F G - disk
    Left Middle Right - peg
    ;; steps are optional scaffolding to express ordered execution if needed by the planner
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40
    s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60
    s61 s62 s63 s64 s65 s66 s67 s68 s69 s70 s71 s72 s73 s74 s75 s76 s77 s78 s79 s80
    s81 s82 s83 s84 s85 s86 s87 s88 s89 s90 s91 s92 s93 s94 s95 s96 s97 s98 s99 s100
    s101 s102 s103 s104 s105 s106 s107 s108 s109 s110 s111 s112 s113 s114 s115 s116 s117 s118 s119 s120
    s121 s122 s123 s124 s125 s126 s127 s128 - step
  )

  ;; Initial State:
  ;; All disks are stacked on Right (top A ... bottom G).
  ;; We represent direct-on relations (on) with immediate support,
  ;; and onpeg mapping (onpeg) to indicate each disk's base peg (Right).
  (:init
    ;; size ordering (smaller is true for pairs where left is smaller than right)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ;; direct support chain top->bottom for initial stacking on Right:
    ;; A on B, B on C, ..., F on G, G on Right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G Right)

    ;; base-peg mapping for all disks is Right
    (onpeg A Right)
    (onpeg B Right)
    (onpeg C Right)
    (onpeg D Right)
    (onpeg E Right)
    (onpeg F Right)
    (onpeg G Right)

    ;; clear markers: A is the top disk; Left and Middle are empty (clear).
    (clear A)
    (clear Left)
    (clear Middle)
    ;; Right is not clear because A sits on it (through chain)
    ;; Other disks are not clear (they have disks above them)
    ;; s1 is enabled as the first step if a fully-ordered execution is desired
    (step-enabled s1)
    ;; chain next-step relationships (optional scaffolding to reflect a fully ordered 127-step plan).
    ;; We include the full chain s1 -> s2 -> ... -> s128 so a planner that chooses to use planned-move facts
    ;; can enforce precise ordering. These facts are optional: a planner can solve purely by dynamics
    ;; or use the planned-move scaffolding if it wants to force the exact sequence below.
    (next-step s1 s2) (next-step s2 s3) (next-step s3 s4) (next-step s4 s5) (next-step s5 s6)
    (next-step s6 s7) (next-step s7 s8) (next-step s8 s9) (next-step s9 s10) (next-step s10 s11)
    (next-step s11 s12) (next-step s12 s13) (next-step s13 s14) (next-step s14 s15) (next-step s15 s16)
    (next-step s16 s17) (next-step s17 s18) (next-step s18 s19) (next-step s19 s20) (next-step s20 s21)
    (next-step s21 s22) (next-step s22 s23) (next-step s23 s24) (next-step s24 s25) (next-step s25 s26)
    (next-step s26 s27) (next-step s27 s28) (next-step s28 s29) (next-step s29 s30) (next-step s30 s31)
    (next-step s31 s32) (next-step s32 s33) (next-step s33 s34) (next-step s34 s35) (next-step s35 s36)
    (next-step s36 s37) (next-step s37 s38) (next-step s38 s39) (next-step s39 s40) (next-step s40 s41)
    (next-step s41 s42) (next-step s42 s43) (next-step s43 s44) (next-step s44 s45) (next-step s45 s46)
    (next-step s46 s47) (next-step s47 s48) (next-step s48 s49) (next-step s49 s50) (next-step s50 s51)
    (next-step s51 s52) (next-step s52 s53) (next-step s53 s54) (next-step s54 s55) (next-step s55 s56)
    (next-step s56 s57) (next-step s57 s58) (next-step s58 s59) (next-step s59 s60) (next-step s60 s61)
    (next-step s61 s62) (next-step s62 s63) (next-step s63 s64) (next-step s64 s65) (next-step s65 s66)
    (next-step s66 s67) (next-step s67 s68) (next-step s68 s69) (next-step s69 s70) (next-step s70 s71)
    (next-step s71 s72) (next-step s72 s73) (next-step s73 s74) (next-step s74 s75) (next-step s75 s76)
    (next-step s76 s77) (next-step s77 s78) (next-step s78 s79) (next-step s79 s80) (next-step s80 s81)
    (next-step s81 s82) (next-step s82 s83) (next-step s83 s84) (next-step s84 s85) (next-step s85 s86)
    (next-step s86 s87) (next-step s87 s88) (next-step s88 s89) (next-step s89 s90) (next-step s90 s91)
    (next-step s91 s92) (next-step s92 s93) (next-step s93 s94) (next-step s94 s95) (next-step s95 s96)
    (next-step s96 s97) (next-step s97 s98) (next-step s98 s99) (next-step s99 s100) (next-step s100 s101)
    (next-step s101 s102) (next-step s102 s103) (next-step s103 s104) (next-step s104 s105) (next-step s105 s106)
    (next-step s106 s107) (next-step s107 s108) (next-step s108 s109) (next-step s109 s110) (next-step s110 s111)
    (next-step s111 s112) (next-step s112 s113) (next-step s113 s114) (next-step s114 s115) (next-step s115 s116)
    (next-step s116 s117) (next-step s117 s118) (next-step s118 s119) (next-step s119 s120) (next-step s120 s121)
    (next-step s121 s122) (next-step s122 s123) (next-step s123 s124) (next-step s124 s125) (next-step s125 s126)
    (next-step s126 s127) (next-step s127 s128)

    ;; Optionally provide the canonical 127-step planned-move facts so a planner can enforce the exact sequence.
    ;; The following planned-move facts correspond to the fully expanded canonical solution
    ;; Move sequence (1..127) taken from the auditor/planner analysis. These facts bind a step id to a
    ;; concrete disk and the source/destination pegs. They are included as hard constraints for planners
    ;; that choose to require exact step ordering via the move action's step guards.
    ;; Only a subset is shown here for brevity; implementors may expand all 127 lines if they require the solver
    ;; to be forced to execute the exact enumerated sequence. The domain supports the full set; leaving them
    ;; in the problem is optional. For strict enforcement, list all planned-move facts from s1..s127.

    ;; Example first several planned moves (expand to all 127 if your run requires full step-for-step enforcement):
    (planned-move s1 A Right Left)
    (planned-move s2 B Right Middle)
    (planned-move s3 A Left Middle)
    (planned-move s4 C Right Left)
    (planned-move s5 A Middle Right)
    (planned-move s6 B Middle Left)
    (planned-move s7 A Right Left)
    (planned-move s8 D Right Middle)
    (planned-move s9 A Left Middle)
    (planned-move s10 B Left Right)
    (planned-move s11 A Middle Right)
    (planned-move s12 C Left Middle)
    (planned-move s13 A Right Left)
    (planned-move s14 B Right Middle)
    (planned-move s15 A Left Middle)
    (planned-move s16 E Right Left)
    (planned-move s17 A Middle Right)
    (planned-move s18 B Middle Left)
    (planned-move s19 A Right Left)
    (planned-move s20 C Middle Right)
    (planned-move s21 A Left Middle)
    (planned-move s22 B Left Right)
    (planned-move s23 A Middle Right)
    (planned-move s24 D Middle Left)
    (planned-move s25 A Right Left)
    (planned-move s26 B Right Middle)
    (planned-move s27 A Left Middle)
    (planned-move s28 C Right Left)
    (planned-move s29 A Middle Right)
    (planned-move s30 B Middle Left)
    (planned-move s31 A Right Left)
    (planned-move s32 F Right Middle)
    (planned-move s33 A Left Middle)
    (planned-move s34 B Left Right)
    (planned-move s35 A Middle Right)
    (planned-move s36 C Left Middle)
    (planned-move s37 A Right Left)
    (planned-move s38 B Right Middle)
    (planned-move s39 A Left Middle)
    (planned-move s40 D Left Right)
    (planned-move s41 A Middle Right)
    (planned-move s42 B Middle Left)
    (planned-move s43 A Right Left)
    (planned-move s44 C Middle Right)
    (planned-move s45 A Left Middle)
    (planned-move s46 B Left Right)
    (planned-move s47 A Middle Right)
    (planned-move s48 E Left Middle)
    (planned-move s49 A Right Left)
    (planned-move s50 B Right Middle)
    (planned-move s51 A Left Middle)
    (planned-move s52 C Right Left)
    (planned-move s53 A Middle Right)
    (planned-move s54 B Middle Left)
    (planned-move s55 A Right Left)
    (planned-move s56 D Right Middle)
    (planned-move s57 A Left Middle)
    (planned-move s58 B Left Right)
    (planned-move s59 A Middle Right)
    (planned-move s60 C Left Middle)
    (planned-move s61 A Right Left)
    (planned-move s62 B Right Middle)
    (planned-move s63 A Left Middle)
    (planned-move s64 G Right Left)
    (planned-move s65 A Middle Right)
    (planned-move s66 B Middle Left)
    (planned-move s67 A Right Left)
    (planned-move s68 C Middle Right)
    (planned-move s69 A Left Middle)
    (planned-move s70 B Left Right)
    (planned-move s71 A Middle Right)
    (planned-move s72 D Middle Left)
    (planned-move s73 A Right Left)
    (planned-move s74 B Right Middle)
    (planned-move s75 A Left Middle)
    (planned-move s76 C Right Left)
    (planned-move s77 A Middle Right)
    (planned-move s78 B Middle Left)
    (planned-move s79 A Right Left)
    (planned-move s80 E Middle Right)
    (planned-move s81 A Left Middle)
    (planned-move s82 B Left Right)
    (planned-move s83 A Middle Right)
    (planned-move s84 C Left Middle)
    (planned-move s85 A Right Left)
    (planned-move s86 B Right Middle)
    (planned-move s87 A Left Middle)
    (planned-move s88 D Left Right)
    (planned-move s89 A Middle Right)
    (planned-move s90 B Middle Left)
    (planned-move s91 A Right Left)
    (planned-move s92 C Middle Right)
    (planned-move s93 A Left Middle)
    (planned-move s94 B Left Right)
    (planned-move s95 A Middle Right)
    (planned-move s96 F Middle Left)
    (planned-move s97 A Right Left)
    (planned-move s98 B Right Middle)
    (planned-move s99 A Left Middle)
    (planned-move s100 C Right Left)
    (planned-move s101 A Middle Right)
    (planned-move s102 B Middle Left)
    (planned-move s103 A Right Left)
    (planned-move s104 D Right Middle)
    (planned-move s105 A Left Middle)
    (planned-move s106 B Left Right)
    (planned-move s107 A Middle Right)
    (planned-move s108 C Middle Left)
    (planned-move s109 A Left Right)
    (planned-move s110 B Left Middle)
    (planned-move s111 A Middle Right)
    (planned-move s112 E Right Left)
    (planned-move s113 A Middle Right)
    (planned-move s114 B Middle Left)
    (planned-move s115 A Right Left)
    (planned-move s116 C Middle Right)
    (planned-move s117 A Left Middle)
    (planned-move s118 B Left Right)
    (planned-move s119 A Middle Right)
    (planned-move s120 D Middle Left)
    (planned-move s121 A Right Left)
    (planned-move s122 B Right Middle)
    (planned-move s123 A Left Middle)
    (planned-move s124 C Right Left)
    (planned-move s125 A Middle Right)
    (planned-move s126 B Middle Left)
    (planned-move s127 A Right Left)
  )

  ;; Goal condition: all disks stacked on Left peg from top A to bottom G,
  ;; and Middle and Right pegs are empty. This fixes the full terminal configuration.
  ;; We also require that, if the planner enforces a strict ordered-step execution,
  ;; all steps s1..s127 are marked done (step-done facts) — i.e., the canonical 127-step plan
  ;; has been executed. This is optional: a conforming planner may achieve the goal
  ;; without explicit step facts, but including the planned-move and step-done facts forces
  ;; step-by-step compliance with the auditor's exact move sequence.
  (:goal (and
    ;; final stack (direct supports)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G Left)

    ;; final base mapping: every disk is onpeg Left
    (onpeg A Left)
    (onpeg B Left)
    (onpeg C Left)
    (onpeg D Left)
    (onpeg E Left)
    (onpeg F Left)
    (onpeg G Left)

    ;; final pegs Middle and Right empty:
    (clear Middle)
    (clear Right)

    ;; final top disk A must be clear
    (clear A)

    ;; If strict ordered sequence is required, require all step-done facts:
    (step-done s1) (step-done s2) (step-done s3) (step-done s4) (step-done s5)
    (step-done s6) (step-done s7) (step-done s8) (step-done s9) (step-done s10)
    (step-done s11) (step-done s12) (step-done s13) (step-done s14) (step-done s15)
    (step-done s16) (step-done s17) (step-done s18) (step-done s19) (step-done s20)
    (step-done s21) (step-done s22) (step-done s23) (step-done s24) (step-done s25)
    (step-done s26) (step-done s27) (step-done s28) (step-done s29) (step-done s30)
    (step-done s31) (step-done s32) (step-done s33) (step-done s34) (step-done s35)
    (step-done s36) (step-done s37) (step-done s38) (step-done s39) (step-done s40)
    (step-done s41) (step-done s42) (step-done s43) (step-done s44) (step-done s45)
    (step-done s46) (step-done s47) (step-done s48) (step-done s49) (step-done s50)
    (step-done s51) (step-done s52) (step-done s53) (step-done s54) (step-done s55)
    (step-done s56) (step-done s57) (step-done s58) (step-done s59) (step-done s60)
    (step-done s61) (step-done s62) (step-done s63) (step-done s64) (step-done s65)
    (step-done s66) (step-done s67) (step-done s68) (step-done s69) (step-done s70)
    (step-done s71) (step-done s72) (step-done s73) (step-done s74) (step-done s75)
    (step-done s76) (step-done s77) (step-done s78) (step-done s79) (step-done s80)
    (step-done s81) (step-done s82) (step-done s83) (step-done s84) (step-done s85)
    (step-done s86) (step-done s87) (step-done s88) (step-done s89) (step-done s90)
    (step-done s91) (step-done s92) (step-done s93) (step-done s94) (step-done s95)
    (step-done s96) (step-done s97) (step-done s98) (step-done s99) (step-done s100)
    (step-done s101) (step-done s102) (step-done s103) (step-done s104) (step-done s105)
    (step-done s106) (step-done s107) (step-done s108) (step-done s109) (step-done s110)
    (step-done s111) (step-done s112) (step-done s113) (step-done s114) (step-done s115)
    (step-done s116) (step-done s117) (step-done s118) (step-done s119) (step-done s120)
    (step-done s121) (step-done s122) (step-done s123) (step-done s124) (step-done s125)
    (step-done s126) (step-done s127)
  ))