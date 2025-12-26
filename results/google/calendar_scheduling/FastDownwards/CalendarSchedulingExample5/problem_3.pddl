(define (problem calendar-scheduling-5)
    (:domain calendar-scheduling)
    (:objects
        S0900 S0930 S1000 S1030 S1100 S1130 S1200 S1230 S1300 S1330 S1400 S1430 S1500 S1530 S1600 S1630 - slot
    )
    (:init
        ;; Kathryn Availability
        (available S0930 kathryn) (available S1000 kathryn) (available S1100 kathryn) 
        (available S1200 kathryn) (available S1230 kathryn) (available S1300 kathryn)
        (available S1430 kathryn) (available S1500 kathryn) (available S1530 kathryn)
        (available S1600 kathryn) 

        ;; Charlotte Availability (Preference enforced: slots S1330 onwards excluded)
        (available S0900 charlotte) (available S0930 charlotte) (available S1000 charlotte)
        (available S1030 charlotte) (available S1100 charlotte) (available S1130 charlotte)
        (available S1230 charlotte) (available S1300 charlotte)

        ;; Lauren Availability
        (available S1000 lauren) (available S1030 lauren) (available S1100 lauren) 
        (available S1130 lauren) (available S1230 lauren) (available S1300 lauren)
        (available S1430 lauren) (available S1600 lauren)
    )
    (:goal (meeting-held))