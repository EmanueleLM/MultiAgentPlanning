(define (domain hanoi_multiagent_20)
  (:requirements :strips :typing)
  (:types
    disk peg
  )
  (:predicates
    (on ?x - disk ?y - object)       ; disk x is supported by y (y is a disk or a peg)
    (onpeg ?x - disk ?p - peg)       ; unused helper (kept for completeness)
    (clear ?x - object)              ; no disk on x (x can be a disk or a peg)
    (top ?p - peg ?x - object)       ; x is the current top object of peg p (x is disk or the peg itself if empty)
    (smaller ?x - disk ?y - object)  ; disk x is smaller than object y
    (disk ?x - disk)                 ; typing facts for compatibility
    (peg ?p - peg)                   ; typing facts for compatibility
  )

  (:action move
    :parameters (?x - disk ?p - peg ?q - peg ?s - object ?y - object)
    :precondition (and
      (disk ?x) (peg ?p) (peg ?q)
      (top ?p ?x)          ; x is top disk at source peg p
      (on ?x ?s)           ; s is the support under x (a disk or the peg itself)
      (top ?q ?y)          ; y is the top object at destination peg q (a disk or the peg itself if empty)
      (clear ?x) (clear ?y)
      (smaller ?x ?y)      ; enforce Hanoi legality (never put larger on smaller)
    )
    :effect (and
      ; detach x from source support s
      (not (on ?x ?s))
      (on ?x ?y)

      ; update source peg p's top marker and clearance
      (not (top ?p ?x))
      (top ?p ?s)
      (clear ?s)

      ; update destination peg q's top marker and clearance
      (not (top ?q ?y))
      (top ?q ?x)
      (not (clear ?y))
      (clear ?x)
    )
  )
)