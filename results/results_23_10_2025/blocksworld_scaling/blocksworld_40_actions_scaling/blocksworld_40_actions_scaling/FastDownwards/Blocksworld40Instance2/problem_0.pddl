(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  ;; Objects (blocks A-J). Names are lowercase in PDDL objects.
  (:objects a b c d e f g h i j - block)

  ;; Comments summarizing integration of agent reports:
  ; The sequence of actions executed by two agents produced the following final arrangement:
  ; - mover1 executed odd-numbered actions; mover1 successfully executed action 1: pickup(c) and then held c throughout.
  ; - mover2 executed even-numbered actions; only actions 33 (pickup(b)) and 34 (putdown(b)) succeeded, producing a separate table stack for b.
  ; Final derived arrangement encoded as the planning goal below.

  (:init
    ;; Initial public configuration (given):
    ;; Stack S1 (bottom->top): g, a, j
    (on a g)
    (on j a)
    (ontable g)

    ;; Stack S2: i, b
    (on b i)
    (ontable i)

    ;; Stack S3: c
    (ontable c)

    ;; Stack S4: h, d, f, e
    (on d h)
    (on f d)
    (on e f)
    (ontable h)

    ;; clear predicates for tops in the initial state
    (clear j)
    (clear b)
    (clear c)
    (clear e)

    ;; no block held initially
    (handempty)
  )

  ;; Goal: the final arrangement derived from integrating both agents' reports:
  ;; - g, a, j remain a stack (a on g, j on a)
  ;; - h, d, f, e remain a stack (d on h, f on d, e on f)
  ;; - i is a single on-table block
  ;; - b ended up as its own single-block stack on the table
  ;; - c is being held (held by mover1 in the report) -> represented as (holding c)
  (:goal (and
    ;; Stack G-A-J
    (on a g)
    (on j a)
    (ontable g)

    ;; Stack H-D-F-E
    (on d h)
    (on f d)
    (on e f)
    (ontable h)

    ;; Single blocks on table
    (ontable i)
    (ontable b)

    ;; C is held (not on the table)
    (holding c)
  ))
)