(define (domain meeting-domain)
  (:requirements :typing :durative-actions :duration-inequalities :timed-initial-literals)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (joseph-available)
    (meeting-done)
  )

  ;; Travel from Chinatown to Nob Hill: asymmetric duration = 8 minutes
  (:durative-action travel-chinatown-to-nobhill
    :parameters (?p - person)
    :duration (= ?duration 8)
    :condition (at start (at ?p chinatown))
    :effect (and
             (at end (not (at ?p chinatown)))
             (at end (at ?p nobhill))
            )
  )

  ;; Travel from Nob Hill to Chinatown: asymmetric duration = 6 minutes
  (:durative-action travel-nobhill-to-chinatown
    :parameters (?p - person)
    :duration (= ?duration 6)
    :condition (at start (at ?p nobhill))
    :effect (and
             (at end (not (at ?p nobhill)))
             (at end (at ?p chinatown))
            )
  )

  ;; Meeting action: must occur at Nob Hill while Joseph is available.
  ;; Duration must be at least 75 minutes. The "over all" conditions ensure
  ;; both participants remain at nobhill and joseph-available stays true for entire meeting.
  (:durative-action meet-with-joseph
    :parameters (?v - person ?j - person ?d - number)
    :duration (>= ?d 75)
    :condition (and
                 (at start (at ?v nobhill))
                 (at start (at ?j nobhill))
                 (over all (at ?v nobhill))
                 (over all (at ?j nobhill))
                 (over all (joseph-available))
               )
    :effect (at end (meeting-done))
  )
)