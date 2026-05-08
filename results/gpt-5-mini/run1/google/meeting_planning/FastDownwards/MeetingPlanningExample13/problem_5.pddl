(define (problem meeting_planning_problem)
  (:domain meeting_planning)

  (:objects
    you_agent - agent
    betty_person - person

    presidio north_beach - location

    t_09_00 t_18_27 t_18_45 t_20_00 t_20_17 t_22_00 t_23_59 - time
  )

  (:init
    (at_time you_agent presidio t_09_00)

    (travel_time presidio north_beach t_18_27 t_18_45)
    (travel_time north_beach presidio t_20_00 t_20_17)

    (wait_time presidio t_09_00 t_18_27)
    (wait_time north_beach t_18_45 t_20_00)

    (meeting_window north_beach t_18_45 t_22_00)

    (meeting_possible t_18_45 t_20_00)
  )

  (:goal (and
    (met betty_person)
    (at_time you_agent presidio t_20_17)
  ))
)