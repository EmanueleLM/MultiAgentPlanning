(define (problem meeting_planning_example_34)
    (:domain meeting_planning)
    (:objects
        me thomas - person
        bayview pacific_heights - location
        t0900 t0923 t1215 t1400 t1715 - timepoint
    )
    (:init
        (at me bayview)
        (at_time t0900)
        
        ;; Temporal order and waiting possibilities
        (next t0900 t0923)
        (next t0923 t1215)
        (next t1215 t1400)
        (next t1400 t1715)
        
        ;; Travel constraints: Bayview to Pacific Heights takes 23 minutes
        (can_travel bayview pacific_heights t0900 t0923)
        
        ;; Meeting constraints: Thomas available at PH from 12:15 to 17:15. 
        ;; A 105-minute meeting from 12:15 to 14:00 is feasible.
        (can_meet me thomas pacific_heights t1215 t1400)
    )
    (:goal
        (and
            (met thomas)
        )
    )
)