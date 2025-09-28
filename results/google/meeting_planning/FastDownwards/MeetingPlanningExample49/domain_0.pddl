(define (domain meeting-scheduling)
  (:requirements :durative-actions :typing :negative-preconditions :fluents :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (available_sarah)
    (meeting_window_closed)
  )
  (:functions
    (num-meetings)
  )

  ;; Travel from Richmond to Bayview (visitor)
  (:durative-action travel_Richmond_to_Bayview
    :parameters ()
    :duration (= ?duration 26)
    :condition (and
      (at start (at visitor Richmond_District))
    )
    :effect (and
      (at start (not (at visitor Richmond_District))) ; depart (no longer considered at source at start of travel)
      (at end (at visitor Bayview))
    )
  )

  ;; Travel from Bayview to Richmond (visitor)
  (:durative-action travel_Bayview_to_Richmond
    :parameters ()
    :duration (= ?duration 25)
    :condition (and
      (at start (at visitor Bayview))
    )
    :effect (and
      (at start (not (at visitor Bayview)))
      (at end (at visitor Richmond_District))
    )
  )

  ;; Meeting with Sarah: must be in Bayview, must be entirely inside Sarah's availability,
  ;; must start before the meeting window is forcibly closed (to enforce earliest feasible start).
  (:durative-action meet_sarah
    :parameters ()
    :duration (= ?duration 45)
    :condition (and
      (at start (at visitor Bayview))
      (at start (available_sarah))         ; Sarah must be available at meeting start
      (at end (available_sarah))           ; Sarah must remain available at meeting end (ensures end <= availability end)
      (at start (not (meeting_window_closed))) ; enforces earliest feasible start (forced by timed literal)
    )
    :effect (and
      (at end (increase (num-meetings) 1))
    )
  )
)