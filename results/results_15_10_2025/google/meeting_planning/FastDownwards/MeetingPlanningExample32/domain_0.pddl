(define (domain sf_meetings)
  (:requirements :typing :durative-actions :fluents :timed-initial-literals :negative-preconditions)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
  )

  (:functions
    (total-meetings) ; numeric fluent to count meetings (to maximize)
  )

  ;--------------------------
  ; Traveler travel actions (distinct actions for traveler)
  ;--------------------------
  (:durative-action travel-traveler-castro-to-ggp
    :parameters ()
    :duration (= ?duration 11) ; 11 minutes travel time The Castro -> Golden Gate Park
    :condition (and
                 (at start (at traveler the_castro))
               )
    :effect (and
              (at end (not (at traveler the_castro)))
              (at end (at traveler golden_gate_park))
            )
  )

  (:durative-action travel-traveler-ggp-to-castro
    :parameters ()
    :duration (= ?duration 13) ; 13 minutes travel time Golden Gate Park -> The Castro
    :condition (and
                 (at start (at traveler golden_gate_park))
               )
    :effect (and
              (at end (not (at traveler golden_gate_park)))
              (at end (at traveler the_castro))
            )
  )

  ;--------------------------
  ; Jeffrey travel actions (kept distinct, but Jeffrey's availability will be enforced by timed literals)
  ;--------------------------
  (:durative-action travel-jeffrey-castro-to-ggp
    :parameters ()
    :duration (= ?duration 11)
    :condition (and
                 (at start (at jeffrey the_castro))
               )
    :effect (and
              (at end (not (at jeffrey the_castro)))
              (at end (at jeffrey golden_gate_park))
            )
  )

  (:durative-action travel-jeffrey-ggp-to-castro
    :parameters ()
    :duration (= ?duration 13)
    :condition (and
                 (at start (at jeffrey golden_gate_park))
               )
    :effect (and
              (at end (not (at jeffrey golden_gate_park)))
              (at end (at jeffrey the_castro))
            )
  )

  ;--------------------------
  ; Meeting action between traveler and Jeffrey at Golden Gate Park
  ; Duration fixed to the minimum required 105 minutes to enforce the minimum meeting length.
  ; The meeting requires both agents be at Golden Gate Park at start and remain there over the entire meeting.
  ; Because Jeffrey's presence at Golden Gate Park is provided via timed initial literals,
  ; this enforces the meeting to occur within Jeffrey's availability window.
  ;--------------------------
  (:durative-action meet-traveler-jeffrey-at-ggp
    :parameters ()
    :duration (= ?duration 105) ; minimum required meeting duration (minutes)
    :condition (and
                 (at start (at traveler golden_gate_park))
                 (at start (at jeffrey golden_gate_park))
                 (over all (at traveler golden_gate_park))
                 (over all (at jeffrey golden_gate_park))
               )
    :effect (and
              (at end (increase (total-meetings) 1))
            )
  )
)