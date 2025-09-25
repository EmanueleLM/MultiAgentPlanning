(define (domain trip-planning)
  :requirements :strips :typing :fluents :numeric :negative-preconditions
  :types agent city
  :predicates
    (at ?a - agent ?c - city)
    (visited ?c - city)
    (attended-show)
  :functions
    (time-used)
    (dur-valencia)
    (dur-lyon)
    (dur-split)

  ;; Traveler actions (stay in a city). Named with "traveler-" prefix.
  ;; Each action increases time-used by the configured duration function.
  :action traveler-stay-valencia
    :parameters (?a - agent)
    :precondition (and
                    (at ?a valencia)
                    (<= (+ (time-used) (dur-valencia)) 16))
    :effect (and
              (visited valencia)
              (increase (time-used) (dur-valencia)))

  :action traveler-stay-lyon
    :parameters (?a - agent)
    :precondition (and
                    (at ?a lyon)
                    (<= (+ (time-used) (dur-lyon)) 16))
    :effect (and
              (visited lyon)
              (increase (time-used) (dur-lyon)))

  ;; To ensure attending the show from day 10..16 inclusive the Split stay
  ;; must start exactly when time-used == 9 (so 9 + 7 = 16).
  :action traveler-stay-split
    :parameters (?a - agent)
    :precondition (and
                    (at ?a split)
                    (= (time-used) 9)
                    (<= (+ (time-used) (dur-split)) 16))
    :effect (and
              (visited split)
              (attended-show)
              (increase (time-used) (dur-split)))

  ;; Flight actions provided by the flight_checker agent (flight- prefix).
  ;; Only direct flights that exist are encoded here (no Valencia <-> Split).
  :action flight-fly-valencia-lyon
    :parameters (?a - agent)
    :precondition (at ?a valencia)
    :effect (and (not (at ?a valencia)) (at ?a lyon))

  :action flight-fly-lyon-valencia
    :parameters (?a - agent)
    :precondition (at ?a lyon)
    :effect (and (not (at ?a lyon)) (at ?a valencia))

  :action flight-fly-lyon-split
    :parameters (?a - agent)
    :precondition (at ?a lyon)
    :effect (and (not (at ?a lyon)) (at ?a split))

  :action flight-fly-split-lyon
    :parameters (?a - agent)
    :precondition (at ?a split)
    :effect (and (not (at ?a split)) (at ?a lyon))
)