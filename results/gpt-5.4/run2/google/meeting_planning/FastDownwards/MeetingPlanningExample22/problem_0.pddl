(define (problem san_francisco_andrew_day_instance)
  (:domain san_francisco_andrew_day)

  (:objects
    presido union_square - location
    andrew - person
    t0900 t0922 t0937 t0952 t1007 t1022 t1037 t1052 t1107 t1115
    t1130 t1145 t1200 t1215 t1230 t1245 t1300 t1315 t1330 t1345
    t1400 t1415 t1430 t1445 t1500 t1515 t1530 t1545 t1600 t1615
    t1630 t1645 t1700 t1715 - time
    m0 m1 m2 m3 m4 m5 m6 m7 - meet_stage
  )

  (:init
    (at presido)
    (current_time t0900)
    (meeting_stage m0)
    (person_at andrew union_square)

    (next_stage m0 m1)
    (next_stage m1 m2)
    (next_stage m2 m3)
    (next_stage m3 m4)
    (next_stage m4 m5)
    (next_stage m5 m6)
    (next_stage m6 m7)

    (travel_22 presido union_square t0900 t0922)

    (wait_step t0922 t0937)
    (wait_step t0937 t0952)
    (wait_step t0952 t1007)
    (wait_step t1007 t1022)
    (wait_step t1022 t1037)
    (wait_step t1037 t1052)
    (wait_step t1052 t1107)
    (wait_step t1107 t1115)
    (wait_step t1115 t1130)
    (wait_step t1130 t1145)
    (wait_step t1145 t1200)
    (wait_step t1200 t1215)
    (wait_step t1215 t1230)
    (wait_step t1230 t1245)
    (wait_step t1245 t1300)
    (wait_step t1300 t1315)
    (wait_step t1315 t1330)
    (wait_step t1330 t1345)
    (wait_step t1345 t1400)
    (wait_step t1400 t1415)
    (wait_step t1415 t1430)
    (wait_step t1430 t1445)
    (wait_step t1445 t1500)
    (wait_step t1500 t1515)
    (wait_step t1515 t1530)
    (wait_step t1530 t1545)
    (wait_step t1545 t1600)
    (wait_step t1600 t1615)
    (wait_step t1615 t1630)
    (wait_step t1630 t1645)
    (wait_step t1645 t1700)
    (wait_step t1700 t1715)

    (available andrew t1115)
    (available andrew t1130)
    (available andrew t1145)
    (available andrew t1200)
    (available andrew t1215)
    (available andrew t1230)
    (available andrew t1245)
    (available andrew t1300)
    (available andrew t1315)
    (available andrew t1330)
    (available andrew t1345)
    (available andrew t1400)
    (available andrew t1415)
    (available andrew t1430)
    (available andrew t1445)
    (available andrew t1500)
    (available andrew t1515)
    (available andrew t1530)
    (available andrew t1545)
    (available andrew t1600)
    (available andrew t1615)
    (available andrew t1630)
    (available andrew t1645)
    (available andrew t1700)
  )

  (:goal
    (and
      (meeting_stage m7)
    )
  )
)