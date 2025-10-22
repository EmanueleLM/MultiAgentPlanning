(define (problem blocks-final-arrangement)
  (:domain blocks-world)

  (:objects a b c d e f g h i j - block)

  (:init
    ;; Initial stacks (given):
    ;; Stack: g, a, j  (g on table, a on g, j on a)
    (on a g)
    (on j a)
    (ontable g)

    ;; Stack: i, b (i on table, b on i)
    (on b i)
    (ontable i)

    ;; Stack: c (c on table)
    (ontable c)

    ;; Stack: h, d, f, e (h on table, d on h, f on d, e on f)
    (on d h)
    (on f d)
    (on e f)
    (ontable h)

    ;; clear predicates for the initial top blocks
    (clear j)
    (clear b)
    (clear c)
    (clear e)

    ;; hand initially empty
    (handempty)
  )

  ;; Goal: verify feasibility of reaching the computed final arrangement.
  ;; Final arrangement encoded as conjunction of direct relations (on / ontable)
  ;; and clear facts for tops. This goal corresponds to:
  ;; Stacks: [G, A, J, C], [I, E], [H, D], [F], [B]
  (:goal (and
    ;; Stack 1: G -> A -> J -> C
    (on a g)
    (on j a)
    (on c j)
    (ontable g)

    ;; Stack 2: I -> E
    (on e i)
    (ontable i)

    ;; Stack 3: H -> D
    (on d h)
    (ontable h)

    ;; Singletons on table
    (ontable f)
    (ontable b)

    ;; Top blocks are clear
    (clear c)
    (clear e)
    (clear d)
    (clear f)
    (clear b)
  ))
)