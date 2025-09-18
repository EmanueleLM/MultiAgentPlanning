(define (domain combined-meet)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types agent location)

  (:predicates
    (at ?ag - agent ?l - location)
    (met)
  )

  (:functions
    (time)           ; absolute minutes since midnight
    (meeting-time)   ; accumulated meeting minutes
    (total-cost)     ; value to minimize (negative of meeting-time)
  )

  ;; --------------------
  ;; Visitor actions (keep distinct)
  ;; --------------------

  ;; Visitor: move from Presidio to Union Square (22 minutes)
  (:action visitor-move-presidio-to-union
    :parameters ()
    :precondition (at visitor presidio)
    :effect (and
              (not (at visitor presidio))
              (at visitor union-square)
              (increase (time) 22)
            )
  )

  ;; Visitor: move from Union Square to Presidio (24 minutes)
  (:action visitor-move-union-to-presidio
    :parameters ()
    :precondition (at visitor union-square)
    :effect (and
              (not (at visitor union-square))
              (at visitor presidio)
              (increase (time) 24)
            )
  )

  ;; Visitor: wait until Andrew arrives at 11:15 (675) if earlier
  (:action visitor-wait-until-1115
    :parameters ()
    :precondition (and (< (time) 675))
    :effect (and
              (assign (time) 675)
            )
  )

  ;; Visitor small wait (1 minute)
  (:action visitor-wait-1
    :parameters ()
    :precondition ()
    :effect (and
              (increase (time) 1)
            )
  )

  ;; Visitor: start a meeting with Andrew for 105 minutes
  ;; Preconditions: both at Union Square; Andrew is present; start between 675 and 930 inclusive
  (:action visitor-meet-andrew
    :parameters ()
    :precondition (and
                    (at visitor union-square)
                    (at andrew union-square)
                    (>= (time) 675)
                    (<= (time) 930)
                  )
    :effect (and
              (met)
              (increase (meeting-time) 105)
              (increase (total-cost) -105)
              (increase (time) 105)
            )
  )

  ;; --------------------
  ;; Andrew actions (keep distinct)
  ;; --------------------

  ;; Andrew arrives at Union Square at 11:15 (675).
  ;; This action models Andrew becoming present at that time.
  ;; It advances the clock to 675 if earlier and places Andrew at union-square.
  (:action andrew-arrive-at-union
    :parameters ()
    :precondition (and (< (time) 675))
    :effect (and
              (assign (time) 675)
              (at andrew union-square)
            )
  )

  ;; Andrew small wait (1 minute) if needed
  (:action andrew-wait-1
    :parameters ()
    :precondition ()
    :effect (and
              (increase (time) 1)
            )
  )
)