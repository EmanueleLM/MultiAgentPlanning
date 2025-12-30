(define (problem meeting-scheduling-18)
    (:domain meeting-planning)
    (:objects
        me - person
        md rd - location
        betty - friend
    )
    (:init
        (at me md) ; Start at Marina District (MD)
        (available betty rd) ; Betty available at Richmond District (RD)
        (= (time-elapsed) 0) ; 9:00 AM start time (0 minutes elapsed)
        (= (total-cost) 0)
        (= (total-meetings) 0)
    )
    (:goal (met betty))
    
    ; The goal is to maximize friends met while strictly adhering to time constraints.
    ; Since only Betty is present, we maximize meetings.
    (:metric maximize (total-meetings))
)