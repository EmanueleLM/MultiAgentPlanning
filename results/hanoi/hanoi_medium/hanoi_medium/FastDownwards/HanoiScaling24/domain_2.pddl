(define (domain hanoi_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (pos ?d - disk ?p - peg ?t - stage)     ; disk ?d is on peg ?p at stage ?t
    (succ ?s - stage ?sn - stage)           ; successor relation on stages
    (used ?s - stage)                       ; stage ?s has been executed (prevents multiple actions per stage)
    (smaller ?x - disk ?y - disk)           ; static size ordering: ?x is smaller than ?y
  )

  ;; Move disk a (smallest). Copies all disk positions from stage ?t to ?tn,
  ;; but for disk a updates its peg to ?to. Ensures the stage is the immediate predecessor.
  (:action move-a-at-stage
    :parameters (?from ?to - peg ?t ?tn - stage
                 ?pb ?pc ?pd ?pe - peg) 
    :precondition (and
      (succ ?t ?tn)
      (not (used ?t))
      (pos a ?from ?t)
      (pos b ?pb ?t)
      (pos c ?pc ?t)
      (pos d ?pd ?t)
      (pos e ?pe ?t)
      ;; disk a is smallest, no smaller-disk checks required
      ;; placement of a onto any peg is allowed (never violates larger-on-smaller)
    )
    :effect (and
      (pos a ?to ?tn)
      (pos b ?pb ?tn)
      (pos c ?pc ?tn)
      (pos d ?pd ?tn)
      (pos e ?pe ?tn)
      (used ?t)
    )
  )

  ;; Move disk b. Ensure no smaller disk (a) is on the source or the target at stage ?t.
  (:action move-b-at-stage
    :parameters (?from ?to - peg ?t ?tn - stage
                 ?pa ?pc ?pd ?pe - peg)
    :precondition (and
      (succ ?t ?tn)
      (not (used ?t))
      (pos a ?pa ?t)
      (pos b ?from ?t)
      (pos c ?pc ?t)
      (pos d ?pd ?t)
      (pos e ?pe ?t)
      (not (pos a ?from ?t))  ; a must not be on top of b at source
      (not (pos a ?to ?t))    ; cannot place b on top of smaller a at target
    )
    :effect (and
      (pos a ?pa ?tn)
      (pos b ?to ?tn)
      (pos c ?pc ?tn)
      (pos d ?pd ?tn)
      (pos e ?pe ?tn)
      (used ?t)
    )
  )

  ;; Move disk c. Ensure no smaller disks (a,b) are on source or target at stage ?t.
  (:action move-c-at-stage
    :parameters (?from ?to - peg ?t ?tn - stage
                 ?pa ?pb ?pd ?pe - peg)
    :precondition (and
      (succ ?t ?tn)
      (not (used ?t))
      (pos a ?pa ?t)
      (pos b ?pb ?t)
      (pos c ?from ?t)
      (pos d ?pd ?t)
      (pos e ?pe ?t)
      (not (pos a ?from ?t))
      (not (pos b ?from ?t))
      (not (pos a ?to ?t))
      (not (pos b ?to ?t))
    )
    :effect (and
      (pos a ?pa ?tn)
      (pos b ?pb ?tn)
      (pos c ?to ?tn)
      (pos d ?pd ?tn)
      (pos e ?pe ?tn)
      (used ?t)
    )
  )

  ;; Move disk d. Ensure no smaller disks (a,b,c) are on source or target at stage ?t.
  (:action move-d-at-stage
    :parameters (?from ?to - peg ?t ?tn - stage
                 ?pa ?pb ?pc ?pe - peg)
    :precondition (and
      (succ ?t ?tn)
      (not (used ?t))
      (pos a ?pa ?t)
      (pos b ?pb ?t)
      (pos c ?pc ?t)
      (pos d ?from ?t)
      (pos e ?pe ?t)
      (not (pos a ?from ?t))
      (not (pos b ?from ?t))
      (not (pos c ?from ?t))
      (not (pos a ?to ?t))
      (not (pos b ?to ?t))
      (not (pos c ?to ?t))
    )
    :effect (and
      (pos a ?pa ?tn)
      (pos b ?pb ?tn)
      (pos c ?pc ?tn)
      (pos d ?to ?tn)
      (pos e ?pe ?tn)
      (used ?t)
    )
  )

  ;; Move disk e (largest). Ensure no smaller disks (a,b,c,d) are on source or target at stage ?t.
  (:action move-e-at-stage
    :parameters (?from ?to - peg ?t ?tn - stage
                 ?pa ?pb ?pc ?pd - peg)
    :precondition (and
      (succ ?t ?tn)
      (not (used ?t))
      (pos a ?pa ?t)
      (pos b ?pb ?t)
      (pos c ?pc ?t)
      (pos d ?pd ?t)
      (pos e ?from ?t)
      (not (pos a ?from ?t))
      (not (pos b ?from ?t))
      (not (pos c ?from ?t))
      (not (pos d ?from ?t))
      (not (pos a ?to ?t))
      (not (pos b ?to ?t))
      (not (pos c ?to ?t))
      (not (pos d ?to ?t))
    )
    :effect (and
      (pos a ?pa ?tn)
      (pos b ?pb ?tn)
      (pos c ?pc ?tn)
      (pos d ?pd ?tn)
      (pos e ?to ?tn)
      (used ?t)
    )
  )
)