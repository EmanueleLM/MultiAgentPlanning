(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    haight_ashbury sunset_district - location
    jessica - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 - time
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (agent_at haight_ashbury)
    (current_time t0)
    (meeting_count jessica c0)
    (can_move haight_ashbury sunset_district)
    (can_move sunset_district haight_ashbury)
    
    (next_time t0 t1) (next_time t1 t2) (next_time t2 t3) (next_time t3 t4) (next_time t4 t5)
    (next_time t5 t6) (next_time t6 t7) (next_time t7 t8) (next_time t8 t9) (next_time t9 t10)
    (next_time t10 t11) (next_time t11 t12) (next_time t12 t13) (next_time t13 t14) (next_time t14 t15)
    (next_time t15 t16) (next_time t16 t17) (next_time t17 t18) (next_time t18 t19) (next_time t19 t20)
    (next_time t20 t21) (next_time t21 t22) (next_time t22 t23) (next_time t23 t24) (next_time t24 t25)
    (next_time t25 t26) (next_time t26 t27) (next_time t27 t28) (next_time t28 t29) (next_time t29 t30)
    (next_time t30 t31) (next_time t31 t32) (next_time t32 t33) (next_time t33 t34) (next_time t34 t35)
    (next_time t35 t36) (next_time t36 t37) (next_time t37 t38) (next_time t38 t39) (next_time t39 t40)
    (next_time t40 t41) (next_time t41 t42) (next_time t42 t43) (next_time t43 t44) (next_time t44 t45)
    
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4) (next_count c4 c5) (next_count c5 c6)
    
    (person_at jessica sunset_district t25)
    (person_at jessica sunset_district t26)
    (person_at jessica sunset_district t27)
    (person_at jessica sunset_district t28)
    (person_at jessica sunset_district t29)
    (person_at jessica sunset_district t30)
    (person_at jessica sunset_district t31)
    (person_at jessica sunset_district t32)
    (person_at jessica sunset_district t33)
    (person_at jessica sunset_district t34)
    (person_at jessica sunset_district t35)
    (person_at jessica sunset_district t36)
    (person_at jessica sunset_district t37)
    (person_at jessica sunset_district t38)
    (person_at jessica sunset_district t39)
    (person_at jessica sunset_district t40)
    (person_at jessica sunset_district t41)
    (person_at jessica sunset_district t42)
    (person_at jessica sunset_district t43)
    (person_at jessica sunset_district t44)
  )
  (:goal
    (meeting_count jessica c6)
  )
)