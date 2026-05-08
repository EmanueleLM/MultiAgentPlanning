(define (domain meet-matthew-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location ?t - timepoint)                ; person p is at location l at timepoint t (snapshot)
    (matt_available ?start - timepoint ?end - timepoint)         ; Matthew available for an interval start..end (we only assert exact candidate intervals used)
    (met_matt)                                                   ; the required meeting (>=30 minutes) with Matthew has been completed
    (plan-chosen)                                                ; a single candidate plan has been chosen and executed
    (inperson_meeting ?p1 - person ?p2 - person ?loc - location ?start - timepoint ?end - timepoint) ; explicit meeting record
  )

  (:functions
    (total-cost)  ; integer objective: total minutes spent away from Nob Hill over the modeled day (used as optimization metric)
  )

  ;; Candidate A: leave Nob Hill at t328 -> arrive Presidio t345, meet 345..375 (30min), return 375..393, end at Nob Hill t393
  (:action plan-A
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t345 t375)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t345 t375)
      (not (at you nobhill t0))
      (at you nobhill t393)
      (increase (total-cost) 65)   ; away minutes for Candidate A: travel 17 + meeting 30 + travel 18 = 65
    )
  )

  ;; Candidate B: leave Nob Hill at t103 -> arrive Presidio t120, meet 120..150 (30min), return arrive NobHill t168
  (:action plan-B
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t120 t150)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t120 t150)
      (not (at you nobhill t0))
      (at you nobhill t168)
      (increase (total-cost) 65)   ; away minutes for Candidate B: travel 17 + meeting 30 + travel 18 = 65
    )
  )

  ;; Candidate C: leave Nob Hill at t163 -> arrive Presidio t180, meet 180..240 (60min), return arrive NobHill t258
  (:action plan-C
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t180 t240)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t180 t240)
      (not (at you nobhill t0))
      (at you nobhill t258)
      (increase (total-cost) 95)   ; away minutes for Candidate C: travel 17 + meeting 60 + travel 18 = 95
    )
  )

  ;; Candidate E: leave Nob Hill at t103 -> arrive Presidio t120, meet 120..375 (255min = full availability), return arrive NobHill t393
  (:action plan-E
    :parameters ()
    :precondition (and
      (at you nobhill t0)
      (matt_available t120 t375)
      (not (plan-chosen))
    )
    :effect (and
      (met_matt)
      (plan-chosen)
      (inperson_meeting you matthew presidio t120 t375)
      (not (at you nobhill t0))
      (at you nobhill t393)
      (increase (total-cost) 290)  ; away minutes for Candidate E: travel 17 + meeting 255 + travel 18 = 290
    )
  )
)