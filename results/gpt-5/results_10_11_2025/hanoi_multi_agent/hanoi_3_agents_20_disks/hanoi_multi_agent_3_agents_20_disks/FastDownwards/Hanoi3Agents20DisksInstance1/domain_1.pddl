(define (domain hanoi-20-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)
  (:predicates
    ; placement and stack structure
    (on ?d - disk ?p - peg)                  ; disk d is on peg p
    (support ?d - disk ?p - peg)             ; disk d is directly supported by peg p (bottom disk on that peg)
    (below ?d1 - disk ?d2 - disk)            ; d1 is immediately above d2 (both on the same peg)

    ; peg and disk status
    (clear ?p - peg)                         ; peg p has no disks
    (top ?d - disk)                          ; no disk is on top of d

    ; size ordering and agent control
    (smaller ?d1 - disk ?d2 - disk)          ; d1 is smaller than d2
    (controls ?a - agent ?d - disk)          ; agent a is allowed to move disk d
  )

  ; Move a top disk x (that sits on some disk u) from peg p to the top of disk y on peg q
  (:action move
    :parameters (?a - agent ?x - disk ?u - disk ?y - disk ?p - peg ?q - peg)
    :precondition (and
      (controls ?a ?x)
      (on ?x ?p)
      (below ?x ?u)
      (top ?x)
      (top ?y)
      (on ?y ?q)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (below ?x ?u))
      (below ?x ?y)
      (top ?u)
      (not (top ?y))
    )
  )

  ; Move a top bottom-disk x (directly supported by peg p) onto the top of disk y on peg q
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?x - disk ?y - disk ?p - peg ?q - peg)
    :precondition (and
      (controls ?a ?x)
      (on ?x ?p)
      (support ?x ?p)
      (top ?x)
      (top ?y)
      (on ?y ?q)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (support ?x ?p))
      (below ?x ?y)
      (not (top ?y))
      (clear ?p)
    )
  )

  ; Move a top disk x (on disk u) from peg p to an empty peg q
  (:action move-to-empty
    :parameters (?a - agent ?x - disk ?u - disk ?p - peg ?q - peg)
    :precondition (and
      (controls ?a ?x)
      (on ?x ?p)
      (below ?x ?u)
      (top ?x)
      (clear ?q)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (below ?x ?u))
      (support ?x ?q)
      (top ?u)
      (not (clear ?q))
    )
  )

  ; Move a top bottom-disk x (supported by peg p) to an empty peg q
  (:action move-peg-to-empty
    :parameters (?a - agent ?x - disk ?p - peg ?q - peg)
    :precondition (and
      (controls ?a ?x)
      (on ?x ?p)
      (support ?x ?p)
      (top ?x)
      (clear ?q)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (support ?x ?p))
      (support ?x ?q)
      (clear ?p)
      (not (clear ?q))
    )
  )
)