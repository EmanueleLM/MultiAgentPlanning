(define (domain meetings-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :timed-initial-literals)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
  )

  (:functions
    (total-meetings)  ; numeric counter of completed meetings
  )

  ;; Travel actions for the traveler (distinct per direction / agent)
  (:durative-action travel-traveler-md-to-ph
    :parameters ()
    :duration (= ?duration 7) ; 7 minutes from Marina District to Pacific Heights
    :condition (and
      (at start (at traveler Marina-District))
    )
    :effect (and
      (at start (not (at traveler Marina-District)))
      (at end   (at traveler Pacific-Heights))
    )
  )

  (:durative-action travel-traveler-ph-to-md
    :parameters ()
    :duration (= ?duration 6) ; 6 minutes from Pacific Heights to Marina District
    :condition (and
      (at start (at traveler Pacific-Heights))
    )
    :effect (and
      (at start (not (at traveler Pacific-Heights)))
      (at end   (at traveler Marina-District))
    )
  )

  ;; Meeting action between traveler and margaret.
  ;; Must be fully contained in Margaret's available interval (enforced via timed initial literals
  ;; that assert margaret's presence at Pacific-Heights between 1140 and 1185).
  ;; Minimum meeting duration is 15 minutes (encoded as fixed duration = 15).
  (:durative-action meet-traveler-margaret-at-ph
    :parameters ()
    :duration (= ?duration 15)  ; Margaret requires a minimum contiguous 15-minute meeting
    :condition (and
      (at start (at traveler Pacific-Heights))
      (at start (at margaret Pacific-Heights))
      (over all (at traveler Pacific-Heights))
      (over all (at margaret Pacific-Heights))
    )
    :effect (and
      (at end (increase (total-meetings) 1))
    )
  )

)