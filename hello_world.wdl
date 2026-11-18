version 1.0

workflow HelloWorld {
  input {
    String name = "World"
  }

  call SayHello { input: name = name }

  output {
    File greeting = SayHello.out
  }
}

task SayHello {
  input {
    String name
  }

  command <<<
    echo "Hello, ~{name}!"
  >>>

  output {
    File out = stdout()
  }

  runtime {
    docker: "ubuntu:22.04"
  }
}
