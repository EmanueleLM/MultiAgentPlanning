(define (domain pddl_orchestrator)
  :requirements :strips :typing :negative-preconditions
  :types disk peg base - object

  :predicates
    ;; disk is directly on support (support is a disk or a base)
    (on ?d - disk ?s - object)
    ;; top maps a support (disk or base) to the object directly above it (disk or base).
    ;; When nothing is above, top maps the support to itself (e.g., top b2 b2, top d1 d1).
    (top ?s - object ?o - object)
    ;; peg to base mapping
    (base-of ?p - peg ?b - base)
    ;; size ordering: smaller ?d ?t means ?d is strictly smaller than ?t (where ?t is disk or base)
    (smaller ?d - disk ?t - object)

  ;; Move a single topmost disk from one support to another support.
  ;; Supports (?from, ?to) are objects that will be either a base or a disk in any valid state.
  ;; Preconditions ensure the disk is directly on ?from, is the topmost disk there, has nothing on it,
  ;; and that it is strictly smaller than the object currently directly on ?to.
  (:action move
    :parameters (?d - disk ?from - object ?to - object ?t - object)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)      ;; ?d is the object directly on ?from (i.e., top of that support)
      (top ?d ?d)         ;; ?d has nothing on it (is topmost)
      (top ?to ?t)        ;; ?t is the object directly on ?to (or ?to itself if empty)
      (smaller ?d ?t)     ;; can only place ?d on smaller-than relation to the object above ?to
    )
    :effect (and
      ;; relocate direct support relation
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update top of the source support: after removing its topmost disk, its top becomes itself
      ;; (this models that nothing is directly above that support unless some other disk remains;
      ;; because action only moves a topmost disk, the top becomes the support itself)
      (not (top ?from ?d))
      (top ?from ?from)
      ;; update top of the destination support: the moved disk becomes the object directly above ?to
      (not (top ?to ?t))
      (top ?to ?d)
    )
  )
)