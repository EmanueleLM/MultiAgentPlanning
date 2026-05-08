(define (problem MeetingPlanningExample8)
    (:domain meeting-planning)
    (:objects
        chinatown marinadistrict - location
        stephanie - person
        ;; Critical time points defined for calculation: T=0, T=12 (travel end), T=255 (LST), T=360 (DDL)
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t255 t360 - timepoint
        
        ;; 106 minute steps needed for minimum 105 minutes duration enforcement
        m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16 m17 m18 m19 m20 m21 m22 m23 m24 m25 m26 m27 m28 m29 m30 m31 m32 m33 m34 m35 m36 m37 m38 m39 m40 m41 m42 m43 m44 m45 m46 m47 m48 m49 m50 m51 m52 m53 m54 m55 m56 m57 m58 m59 m60 m61 m62 m63 m64 m65 m66 m67 m68 m69 m70 m71 m72 m73 m74 m75 m76 m77 m78 m79 m80 m81 m82 m83 m84 m85 m86 m87 m88 m89 m90 m91 m92 m93 m94 m95 m96 m97 m98 m99 m100 m101 m102 m103 m104 m105 - minute-step
    )
    (:init
        (at chinatown)
        (at-time t0) ; Start time 9:00 AM
        (S-met-m m0)
        (= (total-friends-met) 0)

        ;; --- Meeting Duration Sequencing (105 steps) ---
        (is-next-minute m0 m1) (is-next-minute m1 m2) (is-next-minute m2 m3) (is-next-minute m3 m4) 
        (is-next-minute m4 m5) (is-next-minute m5 m6) (is-next-minute m6 m7) (is-next-minute m7 m8) 
        (is-next-minute m8 m9) (is-next-minute m9 m10) (is-next-minute m10 m11) (is-next-minute m11 m12) 
        (is-next-minute m12 m13) (is-next-minute m13 m14) (is-next-minute m14 m15) (is-next-minute m15 m16) 
        (is-next-minute m16 m17) (is-next-minute m17 m18) (is-next-minute m18 m19) (is-next-minute m19 m20) 
        (is-next-minute m20 m21) (is-next-minute m21 m22) (is-next-minute m22 m23) (is-next-minute m23 m24) 
        (is-next-minute m24 m25) (is-next-minute m25 m26) (is-next-minute m26 m27) (is-next-minute m27 m28) 
        (is-next-minute m28 m29) (is-next-minute m29 m30) (is-next-minute m30 m31) (is-next-minute m31 m32) 
        (is-next-minute m32 m33) (is-next-minute m33 m34) (is-next-minute m34 m35) (is-next-minute m35 m36) 
        (is-next-minute m36 m37) (is-next-minute m37 m38) (is-next-minute m38 m39) (is-next-minute m39 m40) 
        (is-next-minute m40 m41) (is-next-minute m41 m42) (is-next-minute m42 m43) (is-next-minute m43 m44) 
        (is-next-minute m44 m45) (is-next-minute m45 m46) (is-next-minute m46 m47) (is-next-minute m47 m48) 
        (is-next-minute m48 m49) (is-next-minute m49 m50) (is-next-minute m50 m51) (is-next-minute m51 m52) 
        (is-next-minute m52 m53) (is-next-minute m53 m54) (is-next-minute m54 m55) (is-next-minute m55 m56) 
        (is-next-minute m56 m57) (is-next-minute m57 m58) (is-next-minute m58 m59) (is-next-minute m59 m60) 
        (is-next-minute m60 m61) (is-next-minute m61 m62) (is-next-minute m62 m63) (is-next-minute m63 m64) 
        (is-next-minute m64 m65) (is-next-minute m65 m66) (is-next-minute m66 m67) (is-next-minute m67 m68) 
        (is-next-minute m68 m69) (is-next-minute m69 m70) (is-next-minute m70 m71) (is-next-minute m71 m72) 
        (is-next-minute m72 m73) (is-next-minute m73 m74) (is-next-minute m74 m75) (is-next-minute m75 m76) 
        (is-next-minute m76 m77) (is-next-minute m77 m78) (is-next-minute m78 m79) (is-next-minute m79 m80) 
        (is-next-minute m80 m81) (is-next-minute m81 m82) (is-next-minute m82 m83) (is-next-minute m83 m84) 
        (is-next-minute m84 m85) (is-next-minute m85 m86) (is-next-minute m86 m87) (is-next-minute m87 m88) 
        (is-next-minute m88 m89) (is-next-minute m89 m90) (is-next-minute m90 m91) (is-next-minute m91 m92) 
        (is-next-minute m92 m93) (is-next-minute m93 m94) (is-next-minute m94 m95) (is-next-minute m95 m96) 
        (is-next-minute m96 m97) (is-next-minute m97 m98) (is-next-minute m98 m99) (is-next-minute m99 m100) 
        (is-next-minute m100 m101) (is-next-minute m101 m102) (is-next-minute m102 m103) (is-next-minute m103 m104) 
        (is-next-minute m104 m105)

        ;; --- Time Sequencing and Constraints ---
        
        ; T_start constraint (LST = 255): Must start before or at t255.
        (before-t256 t0) (before-t256 t12) (before-t256 t255) 

        ; T_end constraint (DDL = 360): Cannot finish after t360.
        (before-t361 t0) (before-t361 t12) (before-t361 t255) (before-t361 t360) 

        ; Travel C->M (12 min jump)
        (is-12-minutes-after t0 t12)
        
        ; Wait time needed for optimal path (T12 -> T255, 243 min wait)
        (can-wait-time t12 t255)
        
        ; Meeting time steps (1 minute increments) for required 105 minutes (T255 -> T360)
        (can-wait-time t255 t360)
    )

    (:goal (met stephanie))

    (:metric maximize (total-friends-met))
)