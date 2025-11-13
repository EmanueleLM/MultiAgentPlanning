(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    ;; static or long-lived world properties (object-level)
    (hand ?h - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)

    ;; time-indexed (step) dynamic predicates
    (vase_at ?a - obj ?b - obj ?t - step)
    (next_at ?a - obj ?b - obj ?t - step)

    ;; explicit successor relation over discrete steps (ordered stages)
    (succ ?t1 - step ?t2 - step)
  )

  ;; All actions take a current step and the immediately succeeding step as parameters.
  ;; Each action requires that the two steps are consecutive via (succ ?t ?t2).
  ;; Preconditions reference predicates at the current step (?t) and effects write results at the next step (?t2).
  ;; This enforces explicit ordered progression and prevents post-hoc oscillation without consuming successive steps.

  ;; paltry(h,a,b,t,t2): requires hand h, cats a, texture b, vase_at h a at t, next_at a b at t
  ;; effects: add next_at h b at t2, remove vase_at h a at t
  (:action paltry
    :parameters (?h - obj ?a - obj ?b - obj ?t - step ?t2 - step)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
      (vase_at ?h ?a ?t)
      (next_at ?a ?b ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next_at ?h ?b ?t2)
      (not (vase_at ?h ?a ?t))
    )
  )

  ;; sip(h,a,b,t,t2): requires hand h, cats a, texture b, next_at h b at t, next_at a b at t
  ;; effects: add vase_at h a at t2, remove next_at h b at t
  (:action sip
    :parameters (?h - obj ?a - obj ?b - obj ?t - step ?t2 - step)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
      (next_at ?h ?b ?t)
      (next_at ?a ?b ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase_at ?h ?a ?t2)
      (not (next_at ?h ?b ?t))
    )
  )

  ;; clip(h,s,t,tstep,tstep2): requires hand h, sneeze s, texture t, next_at s t at tstep, next_at h t at tstep
  ;; effects: add vase_at h s at tstep2, remove next_at h t at tstep
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?tstep - step ?tstep2 - step)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next_at ?s ?t ?tstep)
      (next_at ?h ?t ?tstep)
      (succ ?tstep ?tstep2)
    )
    :effect (and
      (vase_at ?h ?s ?tstep2)
      (not (next_at ?h ?t ?tstep))
    )
  )

  ;; wretched(s, t1, t2, u, tstep, tstep2): requires sneeze s, texture t1, texture t2, stupendous u,
  ;;                                       next_at s t1 at tstep, collect t1 u, collect t2 u
  ;; effects: add next_at s t2 at tstep2, remove next_at s t1 at tstep
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?u - obj ?tstep - step ?tstep2 - step)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?u)
      (next_at ?s ?t1 ?tstep)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
      (succ ?tstep ?tstep2)
    )
    :effect (and
      (next_at ?s ?t2 ?tstep2)
      (not (next_at ?s ?t1 ?tstep))
    )
  )

  ;; memory(c, s1, s2, t, t2): requires cats c, spring s1, spring s2, next_at c s1 at t
  ;; effects: add next_at c s2 at t2, remove next_at c s1 at t
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?t - step ?t2 - step)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next_at ?c ?s1 ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next_at ?c ?s2 ?t2)
      (not (next_at ?c ?s1 ?t))
    )
  )

  ;; tightfisted(h, s, t, tstep, tstep2): requires hand h, sneeze s, texture t, next_at s t at tstep, vase_at h s at tstep
  ;; effects: add next_at h t at tstep2, remove vase_at h s at tstep
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?tstep - step ?tstep2 - step)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next_at ?s ?t ?tstep)
      (vase_at ?h ?s ?tstep)
      (succ ?tstep ?tstep2)
    )
    :effect (and
      (next_at ?h ?t ?tstep2)
      (not (vase_at ?h ?s ?tstep))
    )
  )

)