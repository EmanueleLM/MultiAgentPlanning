(define (problem hanoi-3peg-15-instance-staged)
  (:domain hanoi-3peg-15-staged)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49
    t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 - stage
  )
  (:init
    ; initial stack (top -> bottom) on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O left)
    (clear A)
    (clear middle)
    (clear right)

    ; size legality: any disk can go on any peg
    (can-stack A left) (can-stack A middle) (can-stack A right)
    (can-stack B left) (can-stack B middle) (can-stack B right)
    (can-stack C left) (can-stack C middle) (can-stack C right)
    (can-stack D left) (can-stack D middle) (can-stack D right)
    (can-stack E left) (can-stack E middle) (can-stack E right)
    (can-stack F left) (can-stack F middle) (can-stack F right)
    (can-stack G left) (can-stack G middle) (can-stack G right)
    (can-stack H left) (can-stack H middle) (can-stack H right)
    (can-stack I left) (can-stack I middle) (can-stack I right)
    (can-stack J left) (can-stack J middle) (can-stack J right)
    (can-stack K left) (can-stack K middle) (can-stack K right)
    (can-stack L left) (can-stack L middle) (can-stack L right)
    (can-stack M left) (can-stack M middle) (can-stack M right)
    (can-stack N left) (can-stack N middle) (can-stack N right)
    (can-stack O left) (can-stack O middle) (can-stack O right)

    ; size legality: smaller-on-larger for disks
    (can-stack A B) (can-stack A C) (can-stack A D) (can-stack A E) (can-stack A F) (can-stack A G) (can-stack A H) (can-stack A I) (can-stack A J) (can-stack A K) (can-stack A L) (can-stack A M) (can-stack A N) (can-stack A O)
    (can-stack B C) (can-stack B D) (can-stack B E) (can-stack B F) (can-stack B G) (can-stack B H) (can-stack B I) (can-stack B J) (can-stack B K) (can-stack B L) (can-stack B M) (can-stack B N) (can-stack B O)
    (can-stack C D) (can-stack C E) (can-stack C F) (can-stack C G) (can-stack C H) (can-stack C I) (can-stack C J) (can-stack C K) (can-stack C L) (can-stack C M) (can-stack C N) (can-stack C O)
    (can-stack D E) (can-stack D F) (can-stack D G) (can-stack D H) (can-stack D I) (can-stack D J) (can-stack D K) (can-stack D L) (can-stack D M) (can-stack D N) (can-stack D O)
    (can-stack E F) (can-stack E G) (can-stack E H) (can-stack E I) (can-stack E J) (can-stack E K) (can-stack E L) (can-stack E M) (can-stack E N) (can-stack E O)
    (can-stack F G) (can-stack F H) (can-stack F I) (can-stack F J) (can-stack F K) (can-stack F L) (can-stack F M) (can-stack F N) (can-stack F O)
    (can-stack G H) (can-stack G I) (can-stack G J) (can-stack G K) (can-stack G L) (can-stack G M) (can-stack G N) (can-stack G O)
    (can-stack H I) (can-stack H J) (can-stack H K) (can-stack H L) (can-stack H M) (can-stack H N) (can-stack H O)
    (can-stack I J) (can-stack I K) (can-stack I L) (can-stack I M) (can-stack I N) (can-stack I O)
    (can-stack J K) (can-stack J L) (can-stack J M) (can-stack J N) (can-stack J O)
    (can-stack K L) (can-stack K M) (can-stack K N) (can-stack K O)
    (can-stack L M) (can-stack L N) (can-stack L O)
    (can-stack M N) (can-stack M O)
    (can-stack N O)

    ; staged time progression
    (at t0)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10)
    (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15)
    (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25)
    (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35)
    (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
    (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44) (succ t44 t45)
    (succ t45 t46) (succ t46 t47) (succ t47 t48) (succ t48 t49) (succ t49 t50)
    (succ t50 t51) (succ t51 t52) (succ t52 t53) (succ t53 t54) (succ t54 t55)
    (succ t55 t56) (succ t56 t57) (succ t57 t58) (succ t58 t59) (succ t59 t60)
  )
  (:goal
    (and
      ; final left peg: C, E, F, G, H, I, J, K, L, M, N, O (top -> bottom)
      (on C E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (on L M)
      (on M N)
      (on N O)
      (on O left)
      ; final middle peg: A on D on middle
      (on A D)
      (on D middle)
      ; final right peg: B on right
      (on B right)
      ; tops are clear
      (clear A)
      (clear B)
      (clear C)
    )
  )
)