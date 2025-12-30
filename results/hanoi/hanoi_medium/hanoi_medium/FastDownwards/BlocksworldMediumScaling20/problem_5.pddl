(define (problem BlocksworldMediumScaling20)
    (:domain blocksworld)
    (:objects r b y o - block)
    (:init
        ;; Initial state: r on b, b on y, y on o, o on table. r is clear.
        (clear r)
        (on r b)
        (on b y)
        (on y o)
        (ontable o)
        (arm-empty)
    )
    (:goal (and
        (on o r)
        (on y b)
    ))
)