(define (domain travel)
  (:requirements :strips :typing :fluents)
  (:types town)
  (:predicates
    ;; There is a direct-flight leg from ?from to ?to (symmetric legs must be listed explicitly in the problem if available)
    (leg ?from ?to - town)
    ;; current location
    (at ?c - town)
    ;; marks that this town is the relatives' town
    (relative ?c - town)
    ;; becomes true when the attend-relatives action is executed while at relatives' town and within the allowed window
    (visited-window)
  )
  (:functions
    ;; current day counter (integer valued). Initialised in the problem (e.g. = (day) 0)
    (day)
    ;; relatives visit window bounds are zero-ary numeric functions set in the problem (e.g. = (window-start) 5)
    (window-start)
    (window-end)
    ;; per-town accumulated spent days; initialised to 0 in the problem, increased by stay/attend actions
    (spent ?c - town)
    ;; per-town required visit duration; initialised in the problem (required ?c) -> numeric value
    (required ?c - town)
  )

  ;; action to fly along a provided leg; consumes one day
  (:action fly
    :parameters (?from ?to - town)
    :precondition (and (at ?from) (leg ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (day) 1)
    )
  )

  ;; action to stay in the same town for one day; consumes one day and counts toward the town's spent days
  (:action stay
    :parameters (?c - town)
    :precondition (at ?c)
    :effect (and
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )

  ;; action to attend relatives: can only execute at a town marked relative and only when current day is within the window.
  ;; This action consumes one day and marks visited-window true (so the goal can require it).
  ;; It also increases spent at that town (counts as a day spent there).
  (:action attend-relatives
    :parameters (?c - town)
    :precondition (and
      (at ?c)
      (relative ?c)
      (>= (day) (window-start))
      (<= (day) (window-end))
    )
    :effect (and
      (visited-window)
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )
)