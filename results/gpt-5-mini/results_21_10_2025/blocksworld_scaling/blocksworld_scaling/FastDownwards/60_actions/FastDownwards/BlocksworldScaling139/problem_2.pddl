(define (problem blocksworldscaling139-problem)
  (:domain blocksworldscaling139)

  (:objects
    a b c d e f g h i j k l - block
    table1 table2 table3 table4 - table
  )

  (:init
    (on g table1)
    (on a g)

    (on d table2)
    (on k d)
    (on e k)
    (on j e)
    (on i j)

    (on b table3)
    (on h b)
    (on c h)
    (on l c)

    (on f table4)

    (clear a)
    (clear i)
    (clear l)
    (clear f)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
  )

  (:goal
    (and
      (on l table4)
      (on k l)
      (on j k)
      (on i j)
      (on h i)
      (on g h)
      (on f g)
      (on e f)
      (on d e)
      (on c d)
      (on b c)
      (on a b)
    )
  )
)