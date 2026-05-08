(define (domain meeting-planning)
  (:requirements :strips :typing :durative-actions :duration-constraints :action-costs :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (available ?a - agent ?l - location)
    (meeting-happened ?traveler - agent ?friend - agent)
  )
  (:functions (total-cost))

  ;; Durative action for traveling between locations
  (durative-action travel
    :parameters (?ag - agent ?from - location ?to - location)
    :duration (= ?duration 20) ; Travel time is 20 minutes
    :condition (and (at start (at ?ag ?from))
                    (not (= ?from ?to))) ; Agent must be at 'from' and 'from' must be different from 'to'
    :effect (and (at start (not (at ?ag ?from))) ; Agent leaves 'from' at the start of travel
                 (at end (at ?ag ?to)) ; Agent arrives at 'to' at the end of travel
                 (increase (total-cost) 1))
  )

  ;; Durative action for conducting a meeting
  (durative-action meet
    :parameters (?traveler - agent ?friend - agent ?loc - location)
    :duration (and (>= ?duration 120)) ; Minimum continuous meeting duration of 120 minutes
    :condition (and (at start (at ?traveler ?loc)) ; Traveler must be at the meeting location at the start
                    (at start (available ?friend ?loc)) ; Friend must be available at the meeting location at the start
                    (over all (at ?traveler ?loc)) ; Traveler must remain at the location throughout the meeting
                    (over all (available ?friend ?loc)) ; Friend must remain available throughout the meeting
               )
    :effect (and (at end (meeting-happened ?traveler ?friend)) ; Meeting is considered happened at the end
                 (increase (total-cost) 0)) ; Meeting itself doesn't add cost
  )
)