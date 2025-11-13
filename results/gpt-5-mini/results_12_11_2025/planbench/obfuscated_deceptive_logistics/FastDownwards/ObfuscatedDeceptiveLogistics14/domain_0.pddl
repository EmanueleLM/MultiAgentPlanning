(define (domain orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent phase thing cup clipper item memorytag)

  (:predicates
    (at-phase ?p - phase)
    (succ ?p1 - phase ?p2 - phase)
    (holding ?a - agent ?t - thing)
    (cup-full ?c - cup)
    (cup-empty ?c - cup)
    (sipped ?c - cup)
    (clipper-available ?cl - clipper)
    (clipped ?it - item)
    (done-paltry)
    (done-sip)
    (done-clip)
    (done-wretched)
    (done-memory)
    (done-tightfisted)
    (wretched-state)
    (memorized ?m - memorytag)
    (tightfisted ?a - agent)
  )

  ;; The "paltry" action consumes a held thing and advances the phase.
  (:action paltry
    :parameters (?a - agent ?p - phase ?pnext - phase ?t - thing)
    :precondition (and
      (at-phase ?p)
      (succ ?p ?pnext)
      (holding ?a ?t)
      (not (done-paltry))
    )
    :effect (and
      (done-paltry)
      (not (holding ?a ?t))
      (not (at-phase ?p))
      (at-phase ?pnext)
    )
  )

  ;; The "sip" action consumes a full cup, produces a sipped and empty cup, advances the phase.
  (:action sip
    :parameters (?p - phase ?pnext - phase ?c - cup)
    :precondition (and
      (at-phase ?p)
      (succ ?p ?pnext)
      (cup-full ?c)
      (not (done-sip))
    )
    :effect (and
      (done-sip)
      (sipped ?c)
      (cup-empty ?c)
      (not (cup-full ?c))
      (not (at-phase ?p))
      (at-phase ?pnext)
    )
  )

  ;; The "clip" action requires a sipped cup and an available clipper, produces a clipped item, advances the phase.
  (:action clip
    :parameters (?p - phase ?pnext - phase ?c - cup ?cl - clipper ?it - item)
    :precondition (and
      (at-phase ?p)
      (succ ?p ?pnext)
      (sipped ?c)
      (clipper-available ?cl)
      (not (done-clip))
    )
    :effect (and
      (done-clip)
      (clipped ?it)
      (not (clipper-available ?cl))
      (not (at-phase ?p))
      (at-phase ?pnext)
    )
  )

  ;; The "wretched" action requires paltry and clip to be completed and advances the phase.
  (:action wretched
    :parameters (?p - phase ?pnext - phase)
    :precondition (and
      (at-phase ?p)
      (succ ?p ?pnext)
      (done-paltry)
      (done-clip)
      (not (done-wretched))
    )
    :effect (and
      (done-wretched)
      (wretched-state)
      (not (at-phase ?p))
      (at-phase ?pnext)
    )
  )

  ;; The "memory" action produces a memorized tag and advances the phase.
  (:action memory
    :parameters (?p - phase ?pnext - phase ?m - memorytag)
    :precondition (and
      (at-phase ?p)
      (succ ?p ?pnext)
      (not (done-memory))
    )
    :effect (and
      (done-memory)
      (memorized ?m)
      (not (at-phase ?p))
      (at-phase ?pnext)
    )
  )

  ;; The "tightfisted" action requires a memorized tag and advances to final phase, producing a tightfisted state.
  (:action tightfisted
    :parameters (?a - agent ?p - phase ?pnext - phase ?m - memorytag)
    :precondition (and
      (at-phase ?p)
      (succ ?p ?pnext)
      (memorized ?m)
      (not (done-tightfisted))
    )
    :effect (and
      (done-tightfisted)
      (tightfisted ?a)
      (not (at-phase ?p))
      (at-phase ?pnext)
    )
  )

)